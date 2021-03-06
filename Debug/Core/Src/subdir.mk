################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Src/audioplay.c \
../Core/Src/ini.c \
../Core/Src/leds.c \
../Core/Src/main.c \
../Core/Src/minIni.c \
../Core/Src/player.c \
../Core/Src/stm32f4xx_hal_msp.c \
../Core/Src/stm32f4xx_it.c \
../Core/Src/syscalls.c \
../Core/Src/sysmem.c \
../Core/Src/system_stm32f4xx.c \
../Core/Src/ws2812.c 

OBJS += \
./Core/Src/audioplay.o \
./Core/Src/ini.o \
./Core/Src/leds.o \
./Core/Src/main.o \
./Core/Src/minIni.o \
./Core/Src/player.o \
./Core/Src/stm32f4xx_hal_msp.o \
./Core/Src/stm32f4xx_it.o \
./Core/Src/syscalls.o \
./Core/Src/sysmem.o \
./Core/Src/system_stm32f4xx.o \
./Core/Src/ws2812.o 

C_DEPS += \
./Core/Src/audioplay.d \
./Core/Src/ini.d \
./Core/Src/leds.d \
./Core/Src/main.d \
./Core/Src/minIni.d \
./Core/Src/player.d \
./Core/Src/stm32f4xx_hal_msp.d \
./Core/Src/stm32f4xx_it.d \
./Core/Src/syscalls.d \
./Core/Src/sysmem.d \
./Core/Src/system_stm32f4xx.d \
./Core/Src/ws2812.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/audioplay.o: ../Core/Src/audioplay.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DDEBUG -DSTM32F412Rx -c -I../Core/Inc -I../Middlewares/ST/STM32_Audio/Addons/GAM/Inc -I../Middlewares/ST/STM32_Audio/Addons/Common/Inc -I../Middlewares/ST/STM32_Audio/Addons/SRC441/Inc -I../Middlewares/ST/STM32_Audio/Addons/SRC236/Inc -I../Core/ST7789 -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/Third_Party/FatFs/src -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I"C:/Users/turum/GoogleDrive/Monofon/monofoneScreen_f412/Core/ST7789" -I../Middlewares/ST/STM32_USB_Device_Library/Class/MSC/Inc -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/audioplay.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Core/Src/ini.o: ../Core/Src/ini.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DDEBUG -DSTM32F412Rx -c -I../Core/Inc -I../Middlewares/ST/STM32_Audio/Addons/GAM/Inc -I../Middlewares/ST/STM32_Audio/Addons/Common/Inc -I../Middlewares/ST/STM32_Audio/Addons/SRC441/Inc -I../Middlewares/ST/STM32_Audio/Addons/SRC236/Inc -I../Core/ST7789 -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/Third_Party/FatFs/src -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I"C:/Users/turum/GoogleDrive/Monofon/monofoneScreen_f412/Core/ST7789" -I../Middlewares/ST/STM32_USB_Device_Library/Class/MSC/Inc -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/ini.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Core/Src/leds.o: ../Core/Src/leds.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DDEBUG -DSTM32F412Rx -c -I../Core/Inc -I../Middlewares/ST/STM32_Audio/Addons/GAM/Inc -I../Middlewares/ST/STM32_Audio/Addons/Common/Inc -I../Middlewares/ST/STM32_Audio/Addons/SRC441/Inc -I../Middlewares/ST/STM32_Audio/Addons/SRC236/Inc -I../Core/ST7789 -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/Third_Party/FatFs/src -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I"C:/Users/turum/GoogleDrive/Monofon/monofoneScreen_f412/Core/ST7789" -I../Middlewares/ST/STM32_USB_Device_Library/Class/MSC/Inc -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/leds.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Core/Src/main.o: ../Core/Src/main.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DDEBUG -DSTM32F412Rx -c -I../Core/Inc -I../Middlewares/ST/STM32_Audio/Addons/GAM/Inc -I../Middlewares/ST/STM32_Audio/Addons/Common/Inc -I../Middlewares/ST/STM32_Audio/Addons/SRC441/Inc -I../Middlewares/ST/STM32_Audio/Addons/SRC236/Inc -I../Core/ST7789 -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/Third_Party/FatFs/src -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I"C:/Users/turum/GoogleDrive/Monofon/monofoneScreen_f412/Core/ST7789" -I../Middlewares/ST/STM32_USB_Device_Library/Class/MSC/Inc -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/main.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Core/Src/minIni.o: ../Core/Src/minIni.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DDEBUG -DSTM32F412Rx -c -I../Core/Inc -I../Middlewares/ST/STM32_Audio/Addons/GAM/Inc -I../Middlewares/ST/STM32_Audio/Addons/Common/Inc -I../Middlewares/ST/STM32_Audio/Addons/SRC441/Inc -I../Middlewares/ST/STM32_Audio/Addons/SRC236/Inc -I../Core/ST7789 -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/Third_Party/FatFs/src -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I"C:/Users/turum/GoogleDrive/Monofon/monofoneScreen_f412/Core/ST7789" -I../Middlewares/ST/STM32_USB_Device_Library/Class/MSC/Inc -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/minIni.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Core/Src/player.o: ../Core/Src/player.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DDEBUG -DSTM32F412Rx -c -I../Core/Inc -I../Middlewares/ST/STM32_Audio/Addons/GAM/Inc -I../Middlewares/ST/STM32_Audio/Addons/Common/Inc -I../Middlewares/ST/STM32_Audio/Addons/SRC441/Inc -I../Middlewares/ST/STM32_Audio/Addons/SRC236/Inc -I../Core/ST7789 -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/Third_Party/FatFs/src -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I"C:/Users/turum/GoogleDrive/Monofon/monofoneScreen_f412/Core/ST7789" -I../Middlewares/ST/STM32_USB_Device_Library/Class/MSC/Inc -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/player.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Core/Src/stm32f4xx_hal_msp.o: ../Core/Src/stm32f4xx_hal_msp.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DDEBUG -DSTM32F412Rx -c -I../Core/Inc -I../Middlewares/ST/STM32_Audio/Addons/GAM/Inc -I../Middlewares/ST/STM32_Audio/Addons/Common/Inc -I../Middlewares/ST/STM32_Audio/Addons/SRC441/Inc -I../Middlewares/ST/STM32_Audio/Addons/SRC236/Inc -I../Core/ST7789 -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/Third_Party/FatFs/src -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I"C:/Users/turum/GoogleDrive/Monofon/monofoneScreen_f412/Core/ST7789" -I../Middlewares/ST/STM32_USB_Device_Library/Class/MSC/Inc -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/stm32f4xx_hal_msp.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Core/Src/stm32f4xx_it.o: ../Core/Src/stm32f4xx_it.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DDEBUG -DSTM32F412Rx -c -I../Core/Inc -I../Middlewares/ST/STM32_Audio/Addons/GAM/Inc -I../Middlewares/ST/STM32_Audio/Addons/Common/Inc -I../Middlewares/ST/STM32_Audio/Addons/SRC441/Inc -I../Middlewares/ST/STM32_Audio/Addons/SRC236/Inc -I../Core/ST7789 -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/Third_Party/FatFs/src -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I"C:/Users/turum/GoogleDrive/Monofon/monofoneScreen_f412/Core/ST7789" -I../Middlewares/ST/STM32_USB_Device_Library/Class/MSC/Inc -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/stm32f4xx_it.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Core/Src/syscalls.o: ../Core/Src/syscalls.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DDEBUG -DSTM32F412Rx -c -I../Core/Inc -I../Middlewares/ST/STM32_Audio/Addons/GAM/Inc -I../Middlewares/ST/STM32_Audio/Addons/Common/Inc -I../Middlewares/ST/STM32_Audio/Addons/SRC441/Inc -I../Middlewares/ST/STM32_Audio/Addons/SRC236/Inc -I../Core/ST7789 -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/Third_Party/FatFs/src -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I"C:/Users/turum/GoogleDrive/Monofon/monofoneScreen_f412/Core/ST7789" -I../Middlewares/ST/STM32_USB_Device_Library/Class/MSC/Inc -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/syscalls.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Core/Src/sysmem.o: ../Core/Src/sysmem.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DDEBUG -DSTM32F412Rx -c -I../Core/Inc -I../Middlewares/ST/STM32_Audio/Addons/GAM/Inc -I../Middlewares/ST/STM32_Audio/Addons/Common/Inc -I../Middlewares/ST/STM32_Audio/Addons/SRC441/Inc -I../Middlewares/ST/STM32_Audio/Addons/SRC236/Inc -I../Core/ST7789 -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/Third_Party/FatFs/src -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I"C:/Users/turum/GoogleDrive/Monofon/monofoneScreen_f412/Core/ST7789" -I../Middlewares/ST/STM32_USB_Device_Library/Class/MSC/Inc -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/sysmem.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Core/Src/system_stm32f4xx.o: ../Core/Src/system_stm32f4xx.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DDEBUG -DSTM32F412Rx -c -I../Core/Inc -I../Middlewares/ST/STM32_Audio/Addons/GAM/Inc -I../Middlewares/ST/STM32_Audio/Addons/Common/Inc -I../Middlewares/ST/STM32_Audio/Addons/SRC441/Inc -I../Middlewares/ST/STM32_Audio/Addons/SRC236/Inc -I../Core/ST7789 -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/Third_Party/FatFs/src -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I"C:/Users/turum/GoogleDrive/Monofon/monofoneScreen_f412/Core/ST7789" -I../Middlewares/ST/STM32_USB_Device_Library/Class/MSC/Inc -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/system_stm32f4xx.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Core/Src/ws2812.o: ../Core/Src/ws2812.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DDEBUG -DSTM32F412Rx -c -I../Core/Inc -I../Middlewares/ST/STM32_Audio/Addons/GAM/Inc -I../Middlewares/ST/STM32_Audio/Addons/Common/Inc -I../Middlewares/ST/STM32_Audio/Addons/SRC441/Inc -I../Middlewares/ST/STM32_Audio/Addons/SRC236/Inc -I../Core/ST7789 -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/Third_Party/FatFs/src -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I"C:/Users/turum/GoogleDrive/Monofon/monofoneScreen_f412/Core/ST7789" -I../Middlewares/ST/STM32_USB_Device_Library/Class/MSC/Inc -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/ws2812.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

