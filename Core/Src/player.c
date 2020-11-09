#include "player.h"
#include "audio_fw_glo.h"
#include "src236_glo.h"
#include "src441_glo.h"
#include "gam_glo.h"
#include "main.h"

extern I2S_HandleTypeDef hi2s2;

AUDIO_ErrorTypeDef AUDIO_PLAYER_Stop(void);

#define SELECT_SRC_NONE     0
#define SELECT_SRC_236      1
#define SELECT_SRC_441      2
static AUDIO_OUT_BufferTypeDef BufferCtl; /* to the codec */
static int bufPlayCtrl = 0;
AUDIO_PLAYBACK_StateTypeDef AudioState;
typedef int bool;

FATFS fs;
FIL WavFile;
WAVE_FormatTypeDef WaveFormat;

static uint8_t WavToSrcTmpBuffer[SRC236_FRAME_SIZE_MAX * 2 * 2];
static uint8_t SrcTypeSelected; /* 236, 441, None */
static uint8_t SrcIterations;
static uint32_t WavReadSize; /* nr of bytes to retrieve from storage*/

void *pSrc236PersistentMem;
void *pSrc441PersistentMem;
void *pSrcScratchMem;
void *pGamPersistentMem = NULL;
void *pGamScratchMem = NULL;

static buffer_t InputBuffer;
static buffer_t *pInputBuffer = &InputBuffer;
static buffer_t OutputBuffer;
static buffer_t *pOutputBuffer = &OutputBuffer;

static  buffer_t BufferHandler;
static  buffer_t *pBufferHandler = &BufferHandler;

//static buffer_t *pBufferHandler = &BufferHandler;

static int16_t GamMuteEn[2] = { 0, 0 };
static int16_t TargVoldB[2] = { -12, -12 }; //{-12,-12,-12,-12,-12,-12,-12,-12};

static gam_dynamic_param_t gam_dynamic_param;

volatile bool end_of_file_reached = false;
volatile bool read_next_chunk = false;
volatile uint16_t *signal_play_buff = NULL;
volatile uint16_t *signal_read_buff = NULL;
volatile uint16_t signal_buff1[4096];
volatile uint16_t signal_buff2[4096];
volatile int adccnt = 0;
int32_t error = GAM_ERROR_NONE;

extern configuration config;

static AUDIO_ErrorTypeDef GetFileInfo(char *file_name, WAVE_FormatTypeDef *info) {
	uint32_t bytesread;
	f_close(&WavFile);
	if (f_open(&WavFile, file_name, FA_OPEN_EXISTING | FA_READ) == FR_OK) {
		/* Fill the buffer to Send */
		if (f_read(&WavFile, info, sizeof(WaveFormat), (void*) &bytesread)
				== FR_OK) {
			printf("Going to play file: %s \n", file_name);
			printf("Sample rate : %d Hz \n", (int) (info->SampleRate));
			printf("Channels number : %d \n", info->NbrChannels);
			printf("File Size : %d KB \n", (int) (info->FileSize / 1024));

			return AUDIO_ERROR_NONE;
		}
		//f_close(&WavFile);
	}
	return AUDIO_ERROR_IO;
}

static AUDIO_ErrorTypeDef AUDIO_PLAYER_FromUsbToSrcToCodecBuf(uint16_t offset) {
	uint32_t bytesread;
	uint32_t src_error;
	uint16_t i;

	if (SrcTypeSelected == SELECT_SRC_NONE) {
		FRESULT tmp;
		tmp = f_read(&WavFile, &BufferCtl.buff[offset],
		AUDIO_OUT_BUFFER_SIZE / 2, (void*) &bytesread);
		if (tmp != FR_OK) {
			return (AUDIO_ERROR_IO);
		}
		BufferCtl.fptr += bytesread;
	} else /* SrcTypeSelected != NONE */
	{
		for (i = 0; i < SrcIterations; ++i) {
			if (f_read(&WavFile, &WavToSrcTmpBuffer, WavReadSize,
					(void*) &bytesread) == FR_OK) {
				BufferCtl.fptr += bytesread;
				OutputBuffer.data_ptr = &BufferCtl.buff[offset
						+ i * AUDIO_OUT_BUFFER_SIZE / (2 * SrcIterations)];
				if (SrcTypeSelected == SELECT_SRC_236) {
					src_error = src236_process(pInputBuffer, pOutputBuffer,
							pSrc236PersistentMem);
					if (src_error != SRC236_ERROR_NONE) {
						return (AUDIO_ERROR_SRC);
					}
				} else /* SrcTypeSelected == 441 */
				{
					src_error = src441_process(pInputBuffer, pOutputBuffer,
							pSrc441PersistentMem);
					if (src_error != SRC441_ERROR_NONE) {
						return (AUDIO_ERROR_SRC);
					}
				}
			} else {
				return (AUDIO_ERROR_IO);
			}
		}
	}


	OutputBuffer.data_ptr = &BufferCtl.buff[offset];
	gam_process(pOutputBuffer, pOutputBuffer, pGamPersistentMem);


	return AUDIO_ERROR_NONE;
}

AUDIO_ErrorTypeDef AUDIO_PLAYER_Process(void) {
	//uint32_t elapsed_time;
	AUDIO_ErrorTypeDef audio_error = AUDIO_ERROR_NONE;
	//static uint32_t prev_elapsed_time = 0xFFFFFFFF;
	//uint8_t str[10];

	switch (AudioState) {
	case AUDIO_STATE_PLAY:
		if (BufferCtl.fptr + 44 >= WaveFormat.FileSize) {
			//BSP_AUDIO_OUT_Stop(CODEC_PDWN_SW);
			AudioState = AUDIO_STATE_STOP;
		}

		if (BufferCtl.state == BUFFER_OFFSET_HALF) {
			audio_error = AUDIO_PLAYER_FromUsbToSrcToCodecBuf(0);
			if (audio_error != AUDIO_ERROR_NONE) {
				return audio_error;
			}
			/* Dynamic change done when switching buffer */
			/* Related display processing takes sometime hence better to do it just after a buffer is refilled */
			//AUDIO_PLAYER_Dynamic_Cfg();
			BufferCtl.state = BUFFER_OFFSET_NONE;
		}

		if (BufferCtl.state == BUFFER_OFFSET_FULL) {
			audio_error = AUDIO_PLAYER_FromUsbToSrcToCodecBuf(
			AUDIO_OUT_BUFFER_SIZE / 2);
			if (audio_error != AUDIO_ERROR_NONE) {
				return audio_error;
			}
			/* Dynamic change done when switching buffer */
			/* Related dispay processing takes sometime hence better to do it just after a buffer is refilled */
			//AUDIO_PLAYER_Dynamic_Cfg();
			BufferCtl.state = BUFFER_OFFSET_NONE;
		}

		break;

	case AUDIO_STATE_START:
		//audio_error = AUDIO_PLAYER_Start(FilePos);
		if (audio_error != AUDIO_ERROR_NONE) {
			return audio_error;
		}
		AudioState = AUDIO_STATE_PLAY;
		break;

	case AUDIO_STATE_STOP:
		//BSP_AUDIO_OUT_Stop(CODEC_PDWN_SW);
		AUDIO_PLAYER_Stop();
		AudioState = AUDIO_STATE_WAIT;
		break;

	case AUDIO_STATE_INIT:
		AudioState = AUDIO_STATE_STOP;
	case AUDIO_STATE_WAIT:
	case AUDIO_STATE_IDLE:
	default:

		break;
	}
	return audio_error;
}

int src_init(void) {
	uint32_t src_scratch_mem_size;

	/* Allocate mem for SRC236 and SRC411 */
	pSrc236PersistentMem = malloc(src236_persistent_mem_size); /* 0x1EC  */
	pSrc441PersistentMem = malloc(src441_persistent_mem_size); /* 0x0E8  */
	pGamPersistentMem = malloc(gam_persistent_mem_size); /* gam_persistent_mem_size  0x078 */
	pGamScratchMem = malloc(gam_scratch_mem_size); /* gam_scratch_mem_size  0x01 */

	if (src236_scratch_mem_size > src441_scratch_mem_size) {
		src_scratch_mem_size = src236_scratch_mem_size; /* 0x784 */
	} else {
		src_scratch_mem_size = src441_scratch_mem_size; /* 0xC9C */
	}
	pSrcScratchMem = malloc(src_scratch_mem_size); /* 0xC9C */

	return 0;
}
int playWavFile(char *fname) {
	AUDIO_ErrorTypeDef error = AUDIO_ERROR_NONE;
	src236_static_param_t src236_static_param;
	src441_static_param_t src441_static_param;
	uint32_t src_input_frame_size;
	uint32_t src_error;

	f_close(&WavFile); // WTF???

	GetFileInfo(fname, &WaveFormat);
	if (WaveFormat.NbrChannels != 2) {

		printf("Error: only stereo audio input is supported.\n");
		writeErrorTxt("Error: only stereo audio input is supported.\n");

		f_close(&WavFile);
		AudioState = AUDIO_STATE_STOP;
		return (AUDIO_ERROR_INVALID_VALUE);
	}

	/* Enables and resets CRC-32 from STM32 HW */
	__HAL_RCC_CRC_CLK_ENABLE();
	CRC->CR = CRC_CR_RESET;

	switch (WaveFormat.SampleRate) {
	case 8000:
		src236_static_param.src_mode = SRC236_RATIO_6;
		SrcTypeSelected = SELECT_SRC_236;
		SrcIterations = 1;
		src_input_frame_size = AUDIO_OUT_BUFFER_SIZE / (8 * SrcIterations * 6);
		break;
	case 16000:
		src236_static_param.src_mode = SRC236_RATIO_3;
		SrcTypeSelected = SELECT_SRC_236;
		SrcIterations = 1;
		src_input_frame_size = AUDIO_OUT_BUFFER_SIZE / (8 * SrcIterations * 3);
		break;
	case 24000:
		src236_static_param.src_mode = SRC236_RATIO_2;
		SrcTypeSelected = SELECT_SRC_236;
		SrcIterations = 1;
		src_input_frame_size = AUDIO_OUT_BUFFER_SIZE / (8 * SrcIterations * 2);
		break;
	case 32000:
		src236_static_param.src_mode = SRC236_RATIO_3_2;
		SrcTypeSelected = SELECT_SRC_236;
		SrcIterations = 2; //frame size smaller but processing repeated 2
		src_input_frame_size = AUDIO_OUT_BUFFER_SIZE
				/ (8 * SrcIterations * 3 / 2);
		break;
	case 44100:
		// src441_static_param does not have params to be configured
		SrcTypeSelected = SELECT_SRC_441;
		SrcIterations = 3; // frame size smaller but processing repeated 3 times
		src_input_frame_size = (AUDIO_OUT_BUFFER_SIZE / 480) * 441
				/ (8 * SrcIterations);
		break;
	case 48000:
		SrcTypeSelected = SELECT_SRC_NONE;
		SrcIterations = 2; /* frame size smaller but processing repeated 2 times considering SRC236 input req.*/
		src_input_frame_size = AUDIO_OUT_BUFFER_SIZE / (8 * SrcIterations); /* half buff, stereo, byte x sample */
		break;
	case 96000:
		src236_static_param.src_mode = SRC236_RATIO_1_2;
		SrcTypeSelected = SELECT_SRC_236;
		SrcIterations = 4; // frame size smaller but processing repeated 4 times
		src_input_frame_size = AUDIO_OUT_BUFFER_SIZE
				/ (8 * SrcIterations * 1 / 2);
		break;
	default:
		printf("Error: This sample frequency is not supported.\r\n");
		writeErrorTxt(
				"Error: This sample frequency is not supported. 16 bytesPerSample, stereo, with sample rate 48000Hz recommend\r\n");

		f_close(&WavFile);
		AudioState = AUDIO_STATE_STOP;
		return (AUDIO_ERROR_INVALID_VALUE);
	}

	/* GAM effect reset */
	error = gam_reset(pGamPersistentMem, pGamScratchMem);
	if (error != GAM_ERROR_NONE) {
		return (-1);
	}

	/* GAM dynamic parameters that can be updated here every frame if required */

	gam_dynamic_param.target_volume_dB[0] = ((float)config.volume*80/100)-80;

	error = gam_setConfig(&gam_dynamic_param, pGamPersistentMem);
	if (error != GAM_ERROR_NONE) {
		return (-1);
	}

	WavReadSize = src_input_frame_size * 4; /* stereo & byte x sample */

	if (SrcTypeSelected == SELECT_SRC_236) {
		/* SRC236 effect reset */
		src_error = src236_reset(pSrc236PersistentMem, pSrcScratchMem);
		if (src_error != SRC236_ERROR_NONE) {
			return (AUDIO_ERROR_SRC);
		}
		/* SRC236 effect static parameters setting */
		src_error = src236_setParam(&src236_static_param, pSrc236PersistentMem);
		if (src_error != SRC236_ERROR_NONE) {
			return (AUDIO_ERROR_SRC);
		}
	}

	if (SrcTypeSelected == SELECT_SRC_441) {
		/* SRC236 effect reset */
		src_error = src441_reset(pSrc441PersistentMem, pSrcScratchMem);
		if (src_error != SRC441_ERROR_NONE) {
			return (AUDIO_ERROR_SRC);
		}
		/* SRC236 effect static parameters setting */
		src_error = src441_setParam(&src441_static_param, pSrc441PersistentMem);
		if (src_error != SRC441_ERROR_NONE) {
			return (AUDIO_ERROR_SRC);
		}
	}
	InputBuffer.data_ptr = &WavToSrcTmpBuffer;
	InputBuffer.nb_bytes_per_Sample = WaveFormat.BitPerSample / 8; /* 8 bits in 0ne byte */
	InputBuffer.nb_channels = WaveFormat.NbrChannels;
	InputBuffer.mode = INTERLEAVED;
	InputBuffer.buffer_size = src_input_frame_size;

	OutputBuffer.nb_bytes_per_Sample = WaveFormat.BitPerSample / 8; /* 8 bits in 0ne byte */
	OutputBuffer.nb_channels = WaveFormat.NbrChannels;
	OutputBuffer.mode = INTERLEAVED;
	OutputBuffer.buffer_size = AUDIO_OUT_BUFFER_SIZE / 8; /* half buff, stereo, bytes x sample */

	BufferCtl.state = BUFFER_OFFSET_NONE;
	BufferCtl.fptr = 0;

	/* Get Data from Disk and Remove Wave format header */
	f_lseek(&WavFile, 44);

	/* Fill whole buffer at first time (480+480 stereo samples) */
	error = AUDIO_PLAYER_FromUsbToSrcToCodecBuf(0);
	if (error == AUDIO_ERROR_NONE) {
		error = AUDIO_PLAYER_FromUsbToSrcToCodecBuf(AUDIO_OUT_BUFFER_SIZE / 2);
	}

	/* Sent to codec whole buffer at first time */
	if (error == AUDIO_ERROR_NONE) {
		AudioState = AUDIO_STATE_PLAY;
		//AUDIO_PlaybackDisplayButtons();
		printf("play\r\n");
		if (BufferCtl.fptr != 0) {
			HAL_StatusTypeDef hal_res;
			//int nsamples = sizeof(signal_buff1) / sizeof(signal_buff1[0]);

			//gam_process(pInputBuffer,pOutputBuffer, pGamPersistentMem);

			hal_res = HAL_I2S_Transmit_IT(&hi2s2,
					(uint16_t*) &BufferCtl.buff[0],
					AUDIO_OUT_BUFFER_SIZE / AUDIODATA_SIZE);
			if (hal_res != HAL_OK) {
				printf("I2S - HAL_I2S_Transmit failed, "
						"hal_res = %d!\r\n", hal_res);
				f_close(&WavFile);
				return -12;
			}
			return AUDIO_ERROR_NONE;
		}
	}

	return AUDIO_ERROR_IO;
}
int init_FAT_FS() {
	if (src_init() != 0)
		printf("SRC init error");
	FRESULT res;
	printf("Init SDIO\n");

	printf("CardDetect : %d!\r\n",
			!HAL_GPIO_ReadPin(SDIO_CD_GPIO_Port, SDIO_CD_Pin));
	res = f_mount(&fs, "", 1);
	if (res != FR_OK) {
		printf("f_mount() failed, res = %d\r\n", res);
		return 0;
	}
	printf("f_mount() done!\r\n");
	return 1;

}

AUDIO_ErrorTypeDef AUDIO_PLAYER_Stop(void) {
	AudioState = AUDIO_STATE_STOP;
	//FilePos = 0;

	//BSP_AUDIO_OUT_Stop(CODEC_PDWN_SW);
	f_close(&WavFile);
	return AUDIO_ERROR_NONE;
}

void HAL_I2S_TxCpltCallback(I2S_HandleTypeDef *hi2s) {
	/*if (end_of_file_reached) {
	 return;
	 }*/

	if (AudioState == AUDIO_STATE_PLAY) {
		//BufferCtl.state = BUFFER_OFFSET_FULL;

		if (bufPlayCtrl == 1) // BufferCtl.state == BUFFER_OFFSET_HALF  )
				{
			BufferCtl.state = BUFFER_OFFSET_FULL;
			bufPlayCtrl = 0;

			HAL_I2S_Transmit_IT(&hi2s2, (uint16_t*) &BufferCtl.buff[0],
					(AUDIO_OUT_BUFFER_SIZE / AUDIODATA_SIZE) / 2);
			return;
		}
		if (bufPlayCtrl == 0) //BufferCtl.state == BUFFER_OFFSET_FULL ||BufferCtl.state == BUFFER_OFFSET_NONE)
				{
			bufPlayCtrl = 1;
			BufferCtl.state = BUFFER_OFFSET_HALF;

			HAL_I2S_Transmit_IT(&hi2s2,
					(uint16_t*) &BufferCtl.buff[AUDIO_OUT_BUFFER_SIZE / 2],
					(AUDIO_OUT_BUFFER_SIZE / AUDIODATA_SIZE) / 2);
		}
	}
	/*volatile uint16_t *temp = signal_play_buff;
	 signal_play_buff = signal_read_buff;
	 signal_read_buff = temp;

	 int nsamples = sizeof(signal_buff1) / sizeof(signal_buff1[0]);
	 HAL_I2S_Transmit_IT(&hi2s2, (uint16_t*) signal_play_buff, nsamples);
	 //read_next_chunk = true;
	 */
}

/**
 * @brief  Manages the DMA Half Transfer complete interrupt.
 * @param  None
 * @retval None
 */
void HAL_I2S_TxHalfCpltCallback222(I2S_HandleTypeDef *hi2s) {
	if (AudioState == AUDIO_STATE_PLAY) {
		BufferCtl.state = BUFFER_OFFSET_HALF;
		HAL_I2S_Transmit_IT(&hi2s2,
				(uint16_t*) &BufferCtl.buff[AUDIO_OUT_BUFFER_SIZE / 2],
				AUDIO_OUT_BUFFER_SIZE / AUDIODATA_SIZE);

	}

}
void player() {

	//FIL wavfile;

	FRESULT fr; /* Return value */
	DIR dj; /* Directory object */
	FILINFO fno; /* File information */

	fr = f_findfirst(&dj, &fno, "", "*.wav"); /* Start to search for photo files */

	if (fno.fsize < 1) {
		printf("file not found %s\n", fno.fname);
		HAL_Delay(1000);
	} else {
		printf("found %s\n", fno.fname);

		playWavFile(fno.fname);

		printf("Start loop\n");

		while (1) {

			AUDIO_PLAYER_Process();
		}
	}

}

void writeErrorTxt(const char *buff) {

	FRESULT fr;
	FIL errFile;
	fr = f_open(&errFile, "error.txt", FA_CREATE_ALWAYS | FA_WRITE);
	if (fr != FR_OK) {
		printf("f_open() failed, res = %d\r\n", fr);
		return;
	}

	unsigned int bytesWritten;
	fr = f_write(&errFile, buff, strlen(buff), &bytesWritten);
	if (fr != FR_OK) {
		printf("f_write() failed, res = %d\r\n", fr);
		return;
	}

	fr = f_close(&errFile);
	if (fr != FR_OK) {
		printf("f_close() failed, res = %d\r\n", fr);
		return;
	}

}

