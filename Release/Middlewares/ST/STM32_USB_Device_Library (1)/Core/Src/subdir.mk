################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/ST/STM32_USB_Device_Library\ (1)/Core/Src/usbd_core.c \
../Middlewares/ST/STM32_USB_Device_Library\ (1)/Core/Src/usbd_ctlreq.c \
../Middlewares/ST/STM32_USB_Device_Library\ (1)/Core/Src/usbd_ioreq.c 

OBJS += \
./Middlewares/ST/STM32_USB_Device_Library\ (1)/Core/Src/usbd_core.o \
./Middlewares/ST/STM32_USB_Device_Library\ (1)/Core/Src/usbd_ctlreq.o \
./Middlewares/ST/STM32_USB_Device_Library\ (1)/Core/Src/usbd_ioreq.o 

C_DEPS += \
./Middlewares/ST/STM32_USB_Device_Library\ (1)/Core/Src/usbd_core.d \
./Middlewares/ST/STM32_USB_Device_Library\ (1)/Core/Src/usbd_ctlreq.d \
./Middlewares/ST/STM32_USB_Device_Library\ (1)/Core/Src/usbd_ioreq.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/ST/STM32_USB_Device_Library\ (1)/Core/Src/usbd_core.o: ../Middlewares/ST/STM32_USB_Device_Library\ (1)/Core/Src/usbd_core.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -DUSE_HAL_DRIVER -DSTM32F412Rx -c -I../Core/Inc -I"C:/Users/turum/GoogleDrive/Monofon/monofoneScreen_f412/Middlewares/ST/STM32_Audio/Addons/GAM/Lib" -I"C:/Users/turum/GoogleDrive/Monofon/monofoneScreen_f412/Middlewares/ST/STM32_Audio/Addons/SRC236/Inc" -I"C:/Users/turum/GoogleDrive/Monofon/monofoneScreen_f412/Middlewares/ST/STM32_Audio/Addons/SRC441/Inc" -I"C:/Users/turum/GoogleDrive/Monofon/monofoneScreen_f412/Middlewares/ST/STM32_Audio/Addons/Common/Inc" -I"C:/Users/turum/GoogleDrive/Monofon/monofoneScreen_f412/Core/ST7789" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/Third_Party/FatFs/src -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/MSC/Inc -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Middlewares/ST/STM32_USB_Device_Library (1)/Core/Src/usbd_core.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Middlewares/ST/STM32_USB_Device_Library\ (1)/Core/Src/usbd_ctlreq.o: ../Middlewares/ST/STM32_USB_Device_Library\ (1)/Core/Src/usbd_ctlreq.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -DUSE_HAL_DRIVER -DSTM32F412Rx -c -I../Core/Inc -I"C:/Users/turum/GoogleDrive/Monofon/monofoneScreen_f412/Middlewares/ST/STM32_Audio/Addons/GAM/Lib" -I"C:/Users/turum/GoogleDrive/Monofon/monofoneScreen_f412/Middlewares/ST/STM32_Audio/Addons/SRC236/Inc" -I"C:/Users/turum/GoogleDrive/Monofon/monofoneScreen_f412/Middlewares/ST/STM32_Audio/Addons/SRC441/Inc" -I"C:/Users/turum/GoogleDrive/Monofon/monofoneScreen_f412/Middlewares/ST/STM32_Audio/Addons/Common/Inc" -I"C:/Users/turum/GoogleDrive/Monofon/monofoneScreen_f412/Core/ST7789" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/Third_Party/FatFs/src -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/MSC/Inc -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Middlewares/ST/STM32_USB_Device_Library (1)/Core/Src/usbd_ctlreq.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Middlewares/ST/STM32_USB_Device_Library\ (1)/Core/Src/usbd_ioreq.o: ../Middlewares/ST/STM32_USB_Device_Library\ (1)/Core/Src/usbd_ioreq.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -DUSE_HAL_DRIVER -DSTM32F412Rx -c -I../Core/Inc -I"C:/Users/turum/GoogleDrive/Monofon/monofoneScreen_f412/Middlewares/ST/STM32_Audio/Addons/GAM/Lib" -I"C:/Users/turum/GoogleDrive/Monofon/monofoneScreen_f412/Middlewares/ST/STM32_Audio/Addons/SRC236/Inc" -I"C:/Users/turum/GoogleDrive/Monofon/monofoneScreen_f412/Middlewares/ST/STM32_Audio/Addons/SRC441/Inc" -I"C:/Users/turum/GoogleDrive/Monofon/monofoneScreen_f412/Middlewares/ST/STM32_Audio/Addons/Common/Inc" -I"C:/Users/turum/GoogleDrive/Monofon/monofoneScreen_f412/Core/ST7789" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/Third_Party/FatFs/src -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/MSC/Inc -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Middlewares/ST/STM32_USB_Device_Library (1)/Core/Src/usbd_ioreq.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

