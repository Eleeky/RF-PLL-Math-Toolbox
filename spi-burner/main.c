#include <reg51.h>
#include "UART.h"
#include "SPI.h"

int main()
{
  UARTInit();
  LEDShow(0xff);
  SendString("Welcome to the SPI fucking simple console!\n");
  while (1) {
    unsigned char tempChar;
    tempChar = ReadData();
    if (tempChar == 'v') {
      SendData(0x11);
      NSEN = 0;
    }
    if (tempChar == 'n') {
      SendData(0x22);
      NSEN = 1;
    }
    
    if (tempChar == '0') {
      SPISend(0);
      SendData(0);
    } else if (tempChar == '1') {
      SPISend(1);
      SendData(1);
    } else {
      SendData(tempChar);
    }
  }
  return 0;
}
