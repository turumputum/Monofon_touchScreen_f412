/*
 * leds.c
 *
 *  Created on: Oct 20, 2020
 *      Author: turum
 */
#include "leds.h"

int effectTick;
float front[LED_COUNT];
int ledBright = 0;

int lightLeds = 0;
int ledStep = 0;

extern stateStruct state;
extern configuration config;

RgbColor RGB;
HsvColor HSV;

void initLeds() {

	RGB.r = config.RGB.r;
	RGB.g = config.RGB.g;
	RGB.b = config.RGB.b;

	HSV.h = 0;
	HSV.s = 255;
	HSV.v = config.brightMax;

	for (int t = 0; t < LED_COUNT; t++) {
		float val = sin((float) (6.28 / LED_COUNT) * (float) t);
		if (val > 0) {
			front[t] = val;
		}
	}
}

void refreshLeds() {
	if (HSV.h < 255) {
		HSV.h++;
	} else {
		HSV.h = 0;
	}
	RGB = HsvToRgb(HSV);

	if (state.phoneUp) {
		for (int i = 0; i < LED_COUNT; i++) {
			ws2812_setPixel_gammaCorrection(RGB.r * front[i], RGB.g * front[i],
					RGB.b * front[i], i);
		}
		ws2812_light();

		//shift front
		float tmp = front[0];
		for (int t = 0; t < (LED_COUNT - 1); t++) {
			front[t] = front[t + 1];
		}
		front[LED_COUNT - 1] = tmp;
	} else {
		for (int i = 0; i < LED_COUNT; i++) {
			ws2812_setPixel_gammaCorrection(RGB.r, RGB.g, RGB.b, i);
		}
		ws2812_light();

	}

}
