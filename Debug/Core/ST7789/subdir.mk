################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/ST7789/fonts.c \
../Core/ST7789/st7789.c 

OBJS += \
./Core/ST7789/fonts.o \
./Core/ST7789/st7789.o 

C_DEPS += \
./Core/ST7789/fonts.d \
./Core/ST7789/st7789.d 


# Each subdirectory must supply rules for building sources it contributes
Core/ST7789/fonts.o: ../Core/ST7789/fonts.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DDEBUG -DSTM32F412Rx -c -I../Core/Inc -I../Middlewares/ST/STM32_Audio/Addons/GAM/Inc -I../Middlewares/ST/STM32_Audio/Addons/Common/Inc -I../Middlewares/ST/STM32_Audio/Addons/SRC441/Inc -I../Middlewares/ST/STM32_Audio/Addons/SRC236/Inc -I../Core/ST7789 -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/Third_Party/FatFs/src -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I"C:/Users/turum/GoogleDrive/Monofon/monofoneScreen_f412/Core/ST7789" -I../Middlewares/ST/STM32_USB_Device_Library/Class/MSC/Inc -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/ST7789/fonts.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Core/ST7789/st7789.o: ../Core/ST7789/st7789.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DDEBUG -DSTM32F412Rx -c -I../Core/Inc -I../Middlewares/ST/STM32_Audio/Addons/GAM/Inc -I../Middlewares/ST/STM32_Audio/Addons/Common/Inc -I../Middlewares/ST/STM32_Audio/Addons/SRC441/Inc -I../Middlewares/ST/STM32_Audio/Addons/SRC236/Inc -I../Core/ST7789 -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/Third_Party/FatFs/src -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I"C:/Users/turum/GoogleDrive/Monofon/monofoneScreen_f412/Core/ST7789" -I../Middlewares/ST/STM32_USB_Device_Library/Class/MSC/Inc -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/ST7789/st7789.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

