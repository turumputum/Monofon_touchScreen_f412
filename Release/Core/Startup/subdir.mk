################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../Core/Startup/startup_stm32f412retx.s 

OBJS += \
./Core/Startup/startup_stm32f412retx.o 

S_DEPS += \
./Core/Startup/startup_stm32f412retx.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Startup/startup_stm32f412retx.o: ../Core/Startup/startup_stm32f412retx.s
	arm-none-eabi-gcc -mcpu=cortex-m4 -c -I"C:/Users/turum/GoogleDrive/Monofon/monofoneScreen_f412/Core/ST7789" -I"C:/Users/turum/GoogleDrive/Monofon/monofoneScreen_f412/Middlewares/ST/STM32_Audio/Addons/GAM/Inc" -I"C:/Users/turum/GoogleDrive/Monofon/monofoneScreen_f412/Middlewares/ST/STM32_Audio/Addons/SRC236/Inc" -I"C:/Users/turum/GoogleDrive/Monofon/monofoneScreen_f412/Middlewares/ST/STM32_Audio/Addons/SRC441/Inc" -I"C:/Users/turum/GoogleDrive/Monofon/monofoneScreen_f412/Middlewares/ST/STM32_Audio/Addons/Common/Inc" -x assembler-with-cpp -MMD -MP -MF"Core/Startup/startup_stm32f412retx.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

