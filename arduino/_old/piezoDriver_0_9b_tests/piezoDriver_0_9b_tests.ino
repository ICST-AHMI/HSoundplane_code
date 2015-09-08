#include <Wire.h>
#include <SPI.h>

boolean debugMode = false;

int i2cAddress = 0x59; // general TWI address for DRV2667
unsigned long piezoVal = 0xFFFFFF; // calculation value\

/* ------------------------------------------------- *
 * Arduino pins connected to the piezo driver header *
 * ------------------------------------------------- */
int LED1pin = 5; // LED1 -> Device started up
int LED2pin = 6; // LED2 -> Initialization successful
int LED3pin = 7; // LED3 -> SPI communication indication
int SHCPpin = 13; // Shift clock (i.e. SPI clock)
int Q7Spin = 12; //
int DSpin = 11; // Data serial (i.e. MOSI)
int OEpin = 10;
int STCPpin = 9; // Storage clock
int MRpin = 8; // Master reset

unsigned long piezoArray[2][9] = {
  {0xFFFFFEFF, 0xFFFFFF7F, 0xFFFFFFBF, 0xFFFFFFDF, 0xFFFFFFEF, 0xFFFFFFF7, 0xFFFFFFFB, 0xFFFFFFFD, 0xFFFFFFFE} ,
  {0xFFFFFDFF, 0xFFFFFBFF, 0xFFFFF7FF, 0xFFFFEFFF, 0xFFFFDFFF, 0xFFFFBFFF, 0xFFFF7FFF, 0xFFFEFFFF, 0xFFFDFFFF}
};
unsigned long piezoAllOff = 0xFFFFFFFF;

void RetManagment(int ret) {
    switch (ret) {
    case 0:
      Serial.print("Success.\n");
      break;
    case 1:
      Serial.print("ERROR! Data too long for buffer.\n");
      break;
    case 2:
      Serial.print("ERROR! Received NACK on transmit address.\n");
      break;
    case 3:
      Serial.print("ERRPR! Received NACK on transmit data.\n");
      break;
    case 4:
      Serial.print("ERROR! Other error.\n");
      break;
    default:
      break;
  }
}

void sendToPiezos(unsigned long val) {
  byte piezoTransf;
  
  digitalWrite(LED3pin, LOW);
  piezoTransf = (byte)((val >> 16) & 0xFF); // shift all three bytes to the registers
//  SPI.transfer(piezoTransf);
  shiftOut(DSpin, SHCPpin, MSBFIRST, piezoTransf);
  if(debugMode) {
    Serial.print("- ");
    Serial.print(piezoTransf, BIN);
  }
  piezoTransf = (byte)((val >> 8) & 0xFF);
//  SPI.transfer(piezoTransf);
  shiftOut(DSpin, SHCPpin, MSBFIRST, piezoTransf);
  if(debugMode) {
    Serial.print("\n- ");
    Serial.print(piezoTransf, BIN);
  }
  piezoTransf = (byte)((piezoVal) & 0xFF);
//  SPI.transfer(piezoTransf);
  shiftOut(DSpin, SHCPpin, MSBFIRST, piezoTransf);
  if(debugMode) {
    Serial.print("\n- ");
    Serial.println(piezoTransf, BIN);
  }
  
  digitalWrite(STCPpin, HIGH); // pulse STCP HIGH to store the shift register value
  delayMicroseconds(1);
  digitalWrite(STCPpin, LOW);
  
  digitalWrite(LED3pin, HIGH);
}


void setup() 
{ 
  /* ---------------------- *
   * General initialization *
   * ---------------------- */
  if(debugMode) {
    Serial.begin(115200); // open the arduino serial port
    Serial.print("Bonjour... initializing.\n");
  }

  pinMode(LED1pin, OUTPUT); // defining all three LED pins as output
  pinMode(LED2pin, OUTPUT);
  pinMode(LED3pin, OUTPUT);
  
  for(int i = 0; i < 3; i++) { // fancy LED dancing before starting
    digitalWrite(LED1pin, LOW);
    digitalWrite(LED2pin, HIGH);
    digitalWrite(LED3pin, HIGH);
    delay(50);
    digitalWrite(LED1pin, HIGH);
    digitalWrite(LED2pin, LOW);
    delay(50);
    digitalWrite(LED2pin, HIGH);
    digitalWrite(LED3pin, LOW);
    delay(50);
  }
  digitalWrite(LED1pin, LOW); // Device started up
  digitalWrite(LED2pin, HIGH);
  digitalWrite(LED3pin, HIGH);
  

  /* ------------------ *
   * TWI initialization *
   * ------------------ */
  int ret; // returned ack value from TWI
  
  Wire.begin(); // start i2c
  if(debugMode) {
    Serial.print("Setting up DRV2667.\n");
  }
  
  // Initialization
  Wire.beginTransmission(i2cAddress);
  Wire.write(0x02); // access control register 2
  Wire.write(0x80); // reset device
  ret = Wire.endTransmission();
//  if(debugMode) {
//    RetManagment(ret);
//  }
  
  delay(10);
  
  Wire.beginTransmission(i2cAddress);
  Wire.write(0x02); // access control register 2
  Wire.write(0x00); // wake up device from standby mode
  ret = Wire.endTransmission();
//  if(debugMode) {
//    RetManagment(ret);
//  }
  
  Wire.beginTransmission(i2cAddress);
  Wire.write(0x01); // access control register 1
//  Wire.write(0x04); // id = 0xA; mux = 1 (analog); gain = 0 (25V full scale)
  Wire.write(0x07); // id = 0xA; mux = 1 (analog); gain = 3 (200V full scale)
  ret = Wire.endTransmission();
//  if(debugMode) {
//    RetManagment(ret);
//  }
  
  Wire.beginTransmission(i2cAddress);
  Wire.write(0x02); // access control register 2
  Wire.write(0x02); // enable amplifier
  ret = Wire.endTransmission();
//  if(debugMode) {
//    RetManagment(ret);
//  }

  Wire.beginTransmission(i2cAddress);
  Wire.write(0x01); // access controle register 1 for testing communication
  ret = Wire.endTransmission();
//  if(debugMode) {
//    RetManagment(ret);
//  }
//  if (ret != 0) { // if no ack returned, flash error message
//    for(int i = 0; i < 10; i++) {
//      digitalWrite(LED2pin, HIGH);
//      delay(50);
//      digitalWrite(LED2pin, LOW);
//      delay(50);
//    }
//    digitalWrite(LED2pin, HIGH);
//    for(;;);
//  } else { // if ack returned, switch LED2 on
    digitalWrite(LED2pin, LOW);
//  }
  
  /* ------------------ *
   * SPI initialization *
   * ------------------ */
   if(debugMode) {
     Serial.print("Setting up SPI... ");
   }
   
   pinMode(MRpin, OUTPUT);
   pinMode(STCPpin, OUTPUT);
   pinMode(OEpin, OUTPUT);
   pinMode(SHCPpin, OUTPUT);
   pinMode(DSpin, OUTPUT);
  
   SPI.begin();
   SPI.setClockDivider(SPI_CLOCK_DIV8);

   digitalWrite(MRpin, HIGH); // Master reset active LOW
   digitalWrite(STCPpin, LOW); // Storage clock active on rising edge
   digitalWrite(OEpin, LOW);
  
   
//   delay(2);
   
   if(debugMode) {
     Serial.print("done! Starting now main loop.\n");
   }
   
//   SPI.transfer(0xAA);
//   digitalWrite(OEpin, LOW); // SPI.begin() sets SS (OE) HIGH... so re-write LOW
//   digitalWrite(OEpin, HIGH);

//  shiftOut(DSpin, SHCPpin, MSBFIRST, 0xAA);
  
   piezoVal = piezoArray[0][0] & piezoArray[0][2] & piezoArray[0][4] & piezoArray[0][6];
   sendToPiezos(piezoVal);
//    sendToPiezos(piezoAllOff);
   
//   SPI.end();
} 
 

void loop() 
{
//  piezoVal = (piezoArray[0][0] & piezoArray[0][4] & piezoArray[0][8]);
//    piezoVal = (piezoArray[0][i]);
//    sendToPiezos(piezoVal);
//  for (int i = 0; i < 9; i++) {
//    piezoVal = (i == 8) ? (piezoArray[0][i] & piezoArray[0][0]) : (piezoArray[0][i] & piezoArray[0][i+1]);
//    sendToPiezos(piezoVal);
//    if (debugMode) {
//      Serial.print("\nArray value: ");
//      Serial.println(piezoArray[0][i]);
//      Serial.print("Piezo value: ");
//      Serial.println(piezoVal, BIN);
//    }
//    piezoVal = (piezoVal == 0xFFFFFF) ? 0x000000 : 0xFFFFFF;
//    sendToPiezos(piezoVal);
//  }
//  }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//  for(int i = 0; i < 9; i++) {
//    if(debugMode) {
//      Serial.print("Sending '");
//      Serial.print(piezoVal, BIN);
//      Serial.print("' to the piezos:\n");
//    }
//    
//    digitalWrite(LED3pin, LOW);
//    piezoTransf = (byte)(piezoVal & 0xFF); // shift all three bytes to the registers
////    piezoTransf = 0xff;
//    SPI.transfer(piezoTransf);
//    if(debugMode) {
//      Serial.print("- ");
//      Serial.print(piezoTransf, BIN);
//    }
//    piezoTransf = (byte)((piezoVal >> 8) & 0xFF);
////    piezoTransf = 0xff;
//    SPI.transfer(piezoTransf);
//    if(debugMode) {
//      Serial.print("\n- ");
//      Serial.print(piezoTransf, BIN);
//    }
//    piezoTransf = (byte)((piezoVal >> 16) & 0xFF);
////    piezoTransf = 0xff;
//    SPI.transfer(piezoTransf);
//    if(debugMode) {
//      Serial.print("\n- ");
//      Serial.println(piezoTransf, BIN);
//    }
//    digitalWrite(LED3pin, HIGH);
//    
//    digitalWrite(STCPpin, HIGH); // pulse STCP HIGH to store the shift register value
//    delayMicroseconds(1);
//    digitalWrite(STCPpin, LOW);
//    
//    if(debugMode) {
//      Serial.print("Shifting done! Setting new value.\n");
//    }
//    
////    piezoVal = ((piezoVal == 0xFFFFFFFF) ? 0x00000000 : 0xFFFFFFFF);
//    piezoVal = (piezoVal << 1); // shift to the next piezo left on each channel
//  
//    delay(1000); // wait...
//  }
}
