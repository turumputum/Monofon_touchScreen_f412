################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include USB_DEVICE/Target/subdir.mk
-include USB_DEVICE/App/subdir.mk
-include Middlewares/Third_Party/FatFs/src/option/subdir.mk
-include Middlewares/Third_Party/FatFs/src/subdir.mk
-include Middlewares/ST/STM32_USB_Device_Library/Core/Src/subdir.mk
-include Middlewares/ST/STM32_USB_Device_Library/Class/MSC/Src/subdir.mk
-include FATFS/Target/subdir.mk
-include FATFS/App/subdir.mk
-include Drivers/STM32F4xx_HAL_Driver/Src/subdir.mk
-include Core/Startup/subdir.mk
-include Core/Src/subdir.mk
-include Core/ST7789/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(S_DEPS)),)
-include $(S_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
EXECUTABLES += \
monofoneScreen_f412.elf \

SIZE_OUTPUT += \
default.size.stdout \

OBJDUMP_LIST += \
monofoneScreen_f412.list \

OBJCOPY_BIN += \
monofoneScreen_f412.bin \


# All Target
all: monofoneScreen_f412.elf secondary-outputs

# Tool invocations
monofoneScreen_f412.elf: $(OBJS) $(USER_OBJS) C:\Users\turum\GoogleDrive\Monofon\monofoneScreen_f412\STM32F412RETX_FLASH.ld
	arm-none-eabi-gcc -o "monofoneScreen_f412.elf" @"objects.list" $(USER_OBJS) $(LIBS) -mcpu=cortex-m4 -T"C:\Users\turum\GoogleDrive\Monofon\monofoneScreen_f412\STM32F412RETX_FLASH.ld" --specs=nosys.specs -Wl,-Map="monofoneScreen_f412.map" -Wl,--gc-sections -static -L"C:\Users\turum\GoogleDrive\Monofon\monofoneScreen_f412\Middlewares\ST\STM32_Audio\Addons\SRC236\Lib" -L"C:\Users\turum\GoogleDrive\Monofon\monofoneScreen_f412\Middlewares\ST\STM32_Audio\Addons\SRC441\Lib" -L"C:\Users\turum\GoogleDrive\Monofon\monofoneScreen_f412\Middlewares\ST\STM32_Audio\Addons\GAM\Lib" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -Wl,--start-group -lc -lm -Wl,--end-group
	@echo 'Finished building target: $@'
	@echo ' '

default.size.stdout: $(EXECUTABLES)
	arm-none-eabi-size  $(EXECUTABLES)
	@echo 'Finished building: $@'
	@echo ' '

monofoneScreen_f412.list: $(EXECUTABLES)
	arm-none-eabi-objdump -h -S $(EXECUTABLES) > "monofoneScreen_f412.list"
	@echo 'Finished building: $@'
	@echo ' '

monofoneScreen_f412.bin: $(EXECUTABLES)
	arm-none-eabi-objcopy  -O binary $(EXECUTABLES) "monofoneScreen_f412.bin"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) *
	-@echo ' '

secondary-outputs: $(SIZE_OUTPUT) $(OBJDUMP_LIST) $(OBJCOPY_BIN)

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
