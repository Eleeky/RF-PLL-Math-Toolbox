///////////////////////////////////////////////////////////////
//
// This file is created to realize a low-speed spi bus
//
// AUTHOR: ZHANG Yining
// DATE:   2015/7/3
//
// MCU model independent
//
///////////////////////////////////////////////////////////////

#ifndef __SPI_H__
#define __SPI_H__


#include "SPI.h"
#include <reg51.h>

#define DELAY_I 1
#define DELAY_J 3

sbit SDAT = P0^5;
sbit SCLK = P0^6;
sbit NSEN = P0^7;

sbit LED0 = P1^0;
sbit CP0  = P1^1;

void SPISend(unsigned int c);

void Delay(unsigned int i, unsigned int j);

void LEDShow(unsigned int i);

#endif
