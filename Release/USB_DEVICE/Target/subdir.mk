################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../USB_DEVICE/Target/usbd_conf.c 

OBJS += \
./USB_DEVICE/Target/usbd_conf.o 

C_DEPS += \
./USB_DEVICE/Target/usbd_conf.d 


# Each subdirectory must supply rules for building sources it contributes
USB_DEVICE/Target/usbd_conf.o: ../USB_DEVICE/Target/usbd_conf.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -DUSE_HAL_DRIVER -DSTM32F412Rx -c -I../Core/Inc -I"C:/Users/turum/GoogleDrive/Monofon/monofoneScreen_f412/Middlewares/ST/STM32_Audio/Addons/GAM/Inc" -I"C:/Users/turum/GoogleDrive/Monofon/monofoneScreen_f412/Middlewares/ST/STM32_Audio/Addons/SRC236/Inc" -I"C:/Users/turum/GoogleDrive/Monofon/monofoneScreen_f412/Middlewares/ST/STM32_Audio/Addons/SRC441/Inc" -I"C:/Users/turum/GoogleDrive/Monofon/monofoneScreen_f412/Middlewares/ST/STM32_Audio/Addons/Common/Inc" -I"C:/Users/turum/GoogleDrive/Monofon/monofoneScreen_f412/Core/ST7789" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/Third_Party/FatFs/src -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/MSC/Inc -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"USB_DEVICE/Target/usbd_conf.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

