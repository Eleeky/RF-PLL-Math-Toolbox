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

#include "SPI.h"
#include <reg51.h>

void SPISend(unsigned int c)
{
  if ((c != 0) && (c != 1)) {
    return;
  }
  
  SDAT = c;
  Delay(DELAY_I, DELAY_J);
  SCLK = 1;
  Delay(DELAY_I, DELAY_J);
  SCLK = 0;
  Delay(DELAY_I, DELAY_J);
}

void Delay(unsigned int i, unsigned int j)
{
  unsigned int tempI, tempJ;
  unsigned int trash;
  trash = 0;
  
  for (tempI = 0; tempI < i; tempI++) {
    for (tempJ = 0; tempJ < j; tempJ++) {
      trash++;
    }
  }
}

void LEDShow(unsigned int c)
{
  int i;
  for (i = 0; i < 8; i++) {
    CP0 = 0;
    LED0 = c & 0x01;
    CP0 = 1;
    CP0 = 0;
    c = c >> 1;
  }
}
