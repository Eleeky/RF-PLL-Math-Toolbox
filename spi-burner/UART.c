#include "UART.h"

void UARTInit()
{
  SCON = 0x50;
  // 0x50 for no parity
  // 0xda for 9-bit UART with parity bit init to 1
  // 0xd2 for 9-bit UART with parity bit init to 0
  
  PCON = 0x00;
  
  TMOD = 0x20;
  // set timer 1 to 8-bit auto-reload mode
  
  // TH1 = TL1 = 256 -(FOSC/12/32/BAUD);
  TH1 = 230;
  TL1 = 230; // 243 for 4800
  // the 32 in between is from internal baud rate generator
  
  TR1 = 1;
  // timer1 start
  
  ES = 0;
  // UART interrupt enabled
  
  EA = 0;
  // interrupt master switch on
  
  TI = 1;
  RI = 1;
}


  
void SendData(unsigned char d)
{
  while (!TI);
  TI = 0;
  SBUF = d;
}

void SendString(unsigned char * s)
{
  while (*s) {
    SendData(*s);
    s++;
  }
}

unsigned char ReadData()
{
  unsigned char recvDat;
  while (!RI);
  RI = 0;
  recvDat = SBUF;
  return recvDat;
}

// length is 1-based
// init is the starting point, 0-based
int ReadInBuffer(unsigned char * s, unsigned int init, unsigned int length)
{
  unsigned char tempChar;
  unsigned int i;
  i = init;
  while (i < length) {
    tempChar = ReadData();
    s[i] = tempChar;
    i++;
  }
  
  return (i - 1);
}
