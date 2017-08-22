/* ----------------------------------------------------------
/* This file is created solely for STC89C52RC model
/* Any new model applied, the writer must carefully examine
/* all the register definitions to ensure nothing goes
/* uncontrollable
/*
/* AUTHOR: ZHANG Yining 
/* DATE:   2015/7/2
/*
/* STC89C52RC Serial Port UART Comm Protocol Realization
/*
/* RxD = P3.0;  TxD = P3.1
/*
/* ----------------------------------------------------------*/

#ifndef __UART_H__
#define __UART_H__

#include <reg51.h>

#define FOSC 24000000L
#define BAUD 4800// don't give any number larger than 19200

// define UART parity mode
#define NONE_PARITY  0
#define ODD_PARITY   1
#define EVEN_PARITY  2
#define MARK_PARITY  3
#define SPACE_PARITY 4

void UARTInit();

void SendData(unsigned char d);

void SendString(unsigned char * s);

unsigned char ReadData();

// length is 1-based
// init is the starting point, 0-based
int ReadInBuffer(unsigned char * s, unsigned int init, unsigned int length);

#endif
