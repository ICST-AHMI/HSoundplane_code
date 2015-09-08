#include <Wire.h>

int i2cAddress = 0x59;
int ledPin = 13;

void setup() 
{ 
  Serial.begin(9600);                // open the arduino serial port
  pinMode(ledPin, OUTPUT);           // setup LED for user info
  Wire.begin();                      // start i2c
  Serial.print("Bonjour... starting I2C communication.\n");
  
  // Initialization
  Wire.beginTransmission(i2cAddress);
  Wire.write(0x02);                  // access control register 2
  Wire.write(0x80);                  // reset device
  Wire.endTransmission();
  
  delay(10);
  
  Wire.beginTransmission(i2cAddress);
  Wire.write(0x02);                  // access control register 2
  Wire.write(0x00);                  // wake up device from standby mode
  Wire.endTransmission();
  
  Wire.beginTransmission(i2cAddress);
  Wire.write(0x01);                  // access control register 1
  Wire.write(0x57);                  // id = 0xA; mux = 1 (analog); gain = 3
  Wire.endTransmission();
  
  Wire.beginTransmission(i2cAddress);
  Wire.write(0x02);                  // access control register 2
  Wire.write(0x02);                  // enable amplifier
  Wire.endTransmission();

  Wire.beginTransmission(i2cAddress);
  Wire.write(0x01);                  // access controle register 1 for testing communication
  int retAck = Wire.endTransmission();
  if(retAck != 0) {                  // if no ack returned, flash error message
    for(int i = 0; i < 15; i++) {
      digitalWrite(ledPin, HIGH);
      delay(50);
      digitalWrite(ledPin, LOW);
      delay(50);
    }
  }
  else {                              // if ack returned, flash success message
    for(int i = 0; i < 3; i++) {
      digitalWrite(ledPin, HIGH);
      delay(200);
      digitalWrite(ledPin, LOW);
      delay(200);
    }
  }
} 
 

void loop() 
{
//  /* ==================================
//      DATASHEET PROGRAMMING EXAMPLE
//     ================================== */
//  // CONTROL
//  Wire.beginTransmission(i2cAddress);
//  Wire.write(0x02);
//  Wire.write(0x00);
//  Wire.endTransmission();
//  
//  Wire.beginTransmission(i2cAddress);
//  Wire.write(0x01);
//  Wire.write(0x00);
//  Wire.endTransmission();
//  
//  Wire.beginTransmission(i2cAddress);
//  Wire.write(0x03);
//  Wire.write(0x01);
//  Wire.endTransmission();
//  
//  Wire.beginTransmission(i2cAddress);
//  Wire.write(0x04);
//  Wire.write(0x00);
//  Wire.endTransmission();
// 
// // HEADER
// Wire.beginTransmission(i2cAddress);
// Wire.write(0xFF);
// Wire.write(0x01);
// Wire.endTransmission();
//
// Wire.beginTransmission(i2cAddress);
// Wire.write(0x00);
// Wire.write(0x05);
// Wire.endTransmission();
//
// Wire.beginTransmission(i2cAddress);
// Wire.write(0x01);
// Wire.write(0x80);
// Wire.endTransmission();
//
// Wire.beginTransmission(i2cAddress);
// Wire.write(0x02);
// Wire.write(0x06);
// Wire.endTransmission();
//
// Wire.beginTransmission(i2cAddress);
// Wire.write(0x03);
// Wire.write(0x00);
// Wire.endTransmission();
//
// Wire.beginTransmission(i2cAddress);
// Wire.write(0x04);
// Wire.write(0x09);
// Wire.endTransmission();
//
// Wire.beginTransmission(i2cAddress);
// Wire.write(0x05);
// Wire.write(0x01);
// Wire.endTransmission();
//
//
//  // DATA
//  Wire.beginTransmission(i2cAddress);
//  Wire.write(0x06);
//  Wire.write(0xFF);
//  Wire.endTransmission();
//
//  Wire.beginTransmission(i2cAddress);
//  Wire.write(0x07);
//  Wire.write(0x19);
//  Wire.endTransmission();
//
//  Wire.beginTransmission(i2cAddress);
//  Wire.write(0x08);
//  Wire.write(0x05);
//  Wire.endTransmission();
//
//  Wire.beginTransmission(i2cAddress);
//  Wire.write(0x09);
//  Wire.write(0x00);
//  Wire.endTransmission();
//
//  // CONTROL
//  Wire.beginTransmission(i2cAddress);
//  Wire.write(0xFF);
//  Wire.write(0x00);
//  Wire.endTransmission();
//
//  Wire.beginTransmission(i2cAddress);
//  Wire.write(0x02);
//  Wire.write(0x01);
//  Wire.endTransmission();

//  delay(1000);
}
