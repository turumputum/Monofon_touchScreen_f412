#include "main.h"
#include "fatfs.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
//#include "sine.h"
#include "stdio.h"
#include "string.h"
#include "stm32f4xx_hal.h"

#define CardDet_GPIO_Port SDIO_CD_GPIO_Port
#define CardDet_Pin SDIO_CD_Pin
#define    DWT_CYCCNT    *(volatile unsigned long *)0xE0001004
#define    DWT_CONTROL   *(volatile unsigned long *)0xE0001000
#define    SCB_DEMCR     *(volatile unsigned long *)0xE000EDFC
#define AUDIODATA_SIZE                      2   /* 16-bits audio data size */
#define AUDIO_OUT_BUFFER_SIZE                      3840 /* 480 * 2 (half + half) * 2 (stereo) * 2 (bytes x sample) */

typedef enum {
  AUDIO_STATE_IDLE = 0,
  AUDIO_STATE_WAIT,
  AUDIO_STATE_INIT,
  AUDIO_STATE_START,
  AUDIO_STATE_STOP,
  AUDIO_STATE_PLAY,
  AUDIO_STATE_NEXT,
  AUDIO_STATE_PREVIOUS,
  AUDIO_STATE_FORWARD,
  AUDIO_STATE_BACKWARD,
  AUDIO_STATE_PAUSE,
  AUDIO_STATE_RESUME,
  AUDIO_STATE_ERROR,
}AUDIO_PLAYBACK_StateTypeDef;

extern AUDIO_PLAYBACK_StateTypeDef AudioState;

#define false 0
#define true 1

typedef struct {
  uint32_t ChunkID;       /* 0 */
  uint32_t FileSize;      /* 4 */
  uint32_t FileFormat;    /* 8 */
  uint32_t SubChunk1ID;   /* 12 */
  uint32_t SubChunk1Size; /* 16*/
  uint16_t AudioFormat;   /* 20 */
  uint16_t NbrChannels;   /* 22 */
  uint32_t SampleRate;    /* 24 */

  uint32_t ByteRate;      /* 28 */
  uint16_t BlockAlign;    /* 32 */
  uint16_t BitPerSample;  /* 34 */
  uint32_t SubChunk2ID;   /* 36 */
  uint32_t SubChunk2Size; /* 40 */
}WAVE_FormatTypeDef;

typedef enum {
  BUFFER_OFFSET_NONE = 0,
  BUFFER_OFFSET_HALF,
  BUFFER_OFFSET_FULL,
}BUFFER_StateTypeDef;

/* Audio buffer control struct */
typedef struct {
  uint8_t buff[AUDIO_OUT_BUFFER_SIZE];
  BUFFER_StateTypeDef state;
  uint32_t fptr;
}AUDIO_OUT_BufferTypeDef;

typedef enum {
  AUDIO_ERROR_NONE = 0,
  AUDIO_ERROR_IO,
  AUDIO_ERROR_EOF,
  AUDIO_ERROR_INVALID_VALUE,
  AUDIO_ERROR_CODEC,
  AUDIO_ERROR_SRC,
}AUDIO_ErrorTypeDef;


void init();
int playWavFile(char *fname);
AUDIO_ErrorTypeDef AUDIO_PLAYER_Process(void);
AUDIO_ErrorTypeDef AUDIO_PLAYER_Stop(void);
void writeErrorTxt(const char * buff);
int init_FAT_FS();
