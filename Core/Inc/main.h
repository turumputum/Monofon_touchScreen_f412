/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.h
  * @brief          : Header for main.c file.
  *                   This file contains the common defines of the application.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright (c) 2020 STMicroelectronics.
  * All rights reserved.</center></h2>
  *
  * This software component is licensed by ST under BSD 3-Clause license,
  * the "License"; You may not use this file except in compliance with the
  * License. You may obtain a copy of the License at:
  *                        opensource.org/licenses/BSD-3-Clause
  *
  ******************************************************************************
  */
/* USER CODE END Header */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MAIN_H
#define __MAIN_H

#ifdef __cplusplus
extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "stm32f4xx_hal.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include "ws2812.h"
/* USER CODE END Includes */

/* Exported types ------------------------------------------------------------*/
/* USER CODE BEGIN ET */


typedef struct {
	int changeLang;
	int currentLang;
	int numOfLang;
	int phoneUp;
	int prevPhoneUp;
	int ledRefresh;
} stateStruct;

typedef struct {
	int brightMax;
	int brightMin;
	RgbColor RGB;
	int volume;
	uint8_t animate;
	uint8_t rainbow;
} configuration;
/* USER CODE END ET */

/* Exported constants --------------------------------------------------------*/
/* USER CODE BEGIN EC */

/* USER CODE END EC */

/* Exported macro ------------------------------------------------------------*/
/* USER CODE BEGIN EM */

/* USER CODE END EM */

void HAL_TIM_MspPostInit(TIM_HandleTypeDef *htim);

/* Exported functions prototypes ---------------------------------------------*/
void Error_Handler(void);

/* USER CODE BEGIN EFP */

/* USER CODE END EFP */

/* Private defines -----------------------------------------------------------*/
#define SNS_3_Pin GPIO_PIN_13
#define SNS_3_GPIO_Port GPIOC
#define SNS_4_Pin GPIO_PIN_14
#define SNS_4_GPIO_Port GPIOC
#define VOL_Pin GPIO_PIN_3
#define VOL_GPIO_Port GPIOC
#define ST7789_CS_Pin GPIO_PIN_4
#define ST7789_CS_GPIO_Port GPIOA
#define ST7789_SCK_Pin GPIO_PIN_5
#define ST7789_SCK_GPIO_Port GPIOA
#define ST7789_DC_Pin GPIO_PIN_6
#define ST7789_DC_GPIO_Port GPIOA
#define ST7789_SDA_Pin GPIO_PIN_7
#define ST7789_SDA_GPIO_Port GPIOA
#define ST7789_RST_Pin GPIO_PIN_4
#define ST7789_RST_GPIO_Port GPIOC
#define ST7789_BLK_Pin GPIO_PIN_5
#define ST7789_BLK_GPIO_Port GPIOC
#define ADC_SENS1_Pin GPIO_PIN_0
#define ADC_SENS1_GPIO_Port GPIOB
#define ADC_SENS1B1_Pin GPIO_PIN_1
#define ADC_SENS1B1_GPIO_Port GPIOB
#define SDIO_CD_Pin GPIO_PIN_7
#define SDIO_CD_GPIO_Port GPIOC
#define GPIO_2_Pin GPIO_PIN_6
#define GPIO_2_GPIO_Port GPIOB
#define GPIO_1_Pin GPIO_PIN_7
#define GPIO_1_GPIO_Port GPIOB
#define SNS_1_Pin GPIO_PIN_8
#define SNS_1_GPIO_Port GPIOB
#define SNS_2_Pin GPIO_PIN_9
#define SNS_2_GPIO_Port GPIOB
/* USER CODE BEGIN Private defines */

/* USER CODE END Private defines */

#ifdef __cplusplus
}
#endif

#endif /* __MAIN_H */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
