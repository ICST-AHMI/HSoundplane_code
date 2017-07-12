////////////////////////////////////////////////////////////////////////////
//
//  This file is part of HSoundplane library
//
//	Works with the following hardware (150415):
//		- Soundplane piezo-driver v0.95 - R003
//		- Soundplane piezo-layer v.095 - R006
//
//  Copyright (c) 2015, www.icst.net
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of 
//  this software and associated documentation files (the "Software"), to deal in 
//  the Software without restriction, including without limitation the rights to use, 
//  copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the 
//  Software, and to permit persons to whom the Software is furnished to do so, 
//  subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all 
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
//  INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A 
//  PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT 
//  HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION 
//  OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
//  SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#include <Wire.h>
#include <SPI.h>
#include "drv2667.h"
#include "HSoundplane.h"
#include "slaveSettings.h"

/* -------------------------------------------------------------------------- */
/* -------------------------------------------------------------------------- */
/* | setup																	| */
/* -------------------------------------------------------------------------- */
/* -------------------------------------------------------------------------- */
void setup()
{
	// Starting communication
	Serial.begin(SERIAL_SPEED); // Serial...

  Wire.begin(I2C_SLAVE_ADDRESS); // i2c...
  if(i2cFastMode) Wire.setClock(400000);
  
	SPI.begin(); // SPI...

	// Setting up pin directions & values
	pinMode(LED1_PIN, OUTPUT);			// LEDs...
	pinMode(LED2_PIN, OUTPUT);
	pinMode(LED3_PIN, OUTPUT);
	
	pinMode(MOSI_PIN, OUTPUT);			// SPI...
	pinMode(MISO_PIN, INPUT_PULLUP);
	pinMode(SCK_PIN, OUTPUT);
	pinMode(SS_PIN, INPUT_PULLUP);
  
	pinMode(OE_PIN, OUTPUT);			// shift registers...
	pinMode(LOAD_PIN, OUTPUT);
	pinMode(CLR_PIN, OUTPUT);
	digitalWrite(OE_PIN, HIGH); 		// disable latch outputs
	digitalWrite(CLR_PIN, LOW);			// reset registers
	digitalWrite(CLR_PIN, HIGH);
	digitalWrite(LOAD_PIN, LOW);		// storage clock active on rising edge
	digitalWrite(OE_PIN, LOW);			// enable latch outputs
  
	switchAddress = (I2C_SWITCH_ADDRESS - I2C_SWITCH_ADDR1);
	pinMode(SW_ADDR_0, OUTPUT);			// i2c switch address
	digitalWrite(SW_ADDR_0, (switchAddress & 0x01));
	pinMode(SW_ADDR_1, OUTPUT);
	digitalWrite(SW_ADDR_1, (switchAddress & 0x02));
	pinMode(SW_ADDR_2, OUTPUT);  
	digitalWrite(SW_ADDR_2, (switchAddress & 0x04));
	pinMode(A6, OUTPUT);				// fixing patch for wrong routing on board
	pinMode(A7, OUTPUT);				// "Soundplane piezo-driver v0.95 - R002"
	
	
	syncPinState = false;				// sync pin...
	pinMode(SYNC_PIN_1, OUTPUT);
	digitalWrite(SYNC_PIN_1, syncPinState);
	
	slaveInitFlag = false;				// slave initialization flag...
	slaveNotifyFlag = false;			// slave notification flag...
	slaveWriteFlag = false;				// slave writing command flag...
  
  	if(debug) {
		Serial.print("\nStarting up slave controller... #"); Serial.println(SLAVE_ID, DEC);
		Serial.println("*************************************");
		Serial.print("serial:\n\t- port @ "); Serial.println(SERIAL_SPEED, DEC);
		Serial.print("i2c:\n\t- port @ "); Serial.println((i2cFastMode) ? "400 kHz" : "100 kHz");
		Serial.print("\t- own address: 0x"); Serial.println(I2C_SLAVE_ADDRESS, HEX);
		Serial.print("\t- switch address: 0x"); Serial.println(I2C_SWITCH_ADDRESS, HEX);
		Serial.print("\t- switch address pins: "); Serial.print(switchAddress & 0x04);
		Serial.print(" / "); Serial.print(switchAddress & 0x02); Serial.print(" / "); Serial.println(switchAddress & 0x01);
		Serial.println("piezos:\n\t- raws: 9\n\t- columns: 8\n\t -> available piezos: 72");
		Serial.println("*************************************\n");

		for(uint8_t i = 0; i < 3; i++) {
			digitalWrite(LED1_PIN, LED_ON);
			digitalWrite(LED2_PIN, LED_OFF);
			digitalWrite(LED3_PIN, LED_OFF);
			delay(50);
			digitalWrite(LED1_PIN, LED_OFF);
			digitalWrite(LED2_PIN, LED_ON);
			delay(50);
			digitalWrite(LED2_PIN, LED_OFF);
			digitalWrite(LED3_PIN, LED_ON);
			delay(50);
		}
	}

  initializeSlaves();
  
  // send the piezo bitmasks to the shift registers
  //piezoSend(0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF); // this should switch all relais on.
  piezoSend(0x00, 0x00, 0x00); // this should switch all relais on.
	
	// announcing startup done...
	digitalWrite(LED1_PIN, LED_ON);
	digitalWrite(LED2_PIN, LED_OFF);
	digitalWrite(LED3_PIN, LED_OFF);
}


/* -------------------------------------------------------------------------- */
/* -------------------------------------------------------------------------- */
/* | loop																	| */
/* -------------------------------------------------------------------------- */
/* -------------------------------------------------------------------------- */
void loop()
{
  delay(1000);
  digitalWrite(LED1_PIN, LED_ON);
  delay(1000);
  digitalWrite(LED1_PIN, LED_OFF);
}


/* -------------------------------------------------------------------------- */
/* -------------------------------------------------------------------------- */
/* | initializeSlaves                                                       | */
/* -------------------------------------------------------------------------- */
/* -------------------------------------------------------------------------- */
void initializeSlaves(void)
{
  uint8_t receivedAddr;
  bool reset = true;
  bool on = true;
  uint8_t gain = 3;
  uint8_t drvMask = 0xFF;


  // Set up the drv2667 and notify if succeeded
  setupSlaveDrv(I2C_SWITCH_ADDR1, drvMask, reset, on, gain);
  bool notify = ((I2C_SWITCH_ADDR1 & drvMask) == drvMask) ? true : false;
  if (debug) {
    Serial.print("Slave set up...");
    Serial.print("Sent: "); Serial.print(drvMask, BIN);
    Serial.print("Notification: "); Serial.println(notify, DEC);
    Serial.println("");
  }
}

/* -------------------------------------------------------------------------- */
/* -------------------------------------------------------------------------- */
/* | setupSlaveDrv                                                          | */
/*    this will connect to all the slaves drivers and sets them up.         | */
/*    the slaves drivers are the audio amplifiers that need to be address   | */
/*    through the slaves I2C switch chip, and because the addressing of the | */
/*    audio amplifiers (which all have the same I2C address) would cause    | */
/*    collisions if the slaves themself would do it                         | */
/* -------------------------------------------------------------------------- */
/* -------------------------------------------------------------------------- */

// addr = address of the slaves I2C switch
// reset = if true resets all the drivers
// on = if true switches all the drivers on
// gain = sets the gain value of the driver
uint8_t setupSlaveDrv(int8_t addr, uint8_t dbm, bool reset, bool on, uint8_t gain)
{
  int8_t i2cRet;
  uint8_t retVal = 0;
  bool activeDrv[HS_DPS];

  // Test which driver the current command is for
  for (uint8_t i = 0; i < HS_DPS; i++) {
    activeDrv[i] = ((dbm >> i) & 1) ? true : false;
  }

  // Setup commands...
  // ...reset
  if (reset) {
    if (debug) {
      Serial.println("\nResetting drv2667...");
      Serial.print("- addressing i2c switch @ 0x"); Serial.println(addr, HEX);
    }

    // open each i2c switch channel and send reset command to the attached drv2667
    for (uint8_t i = 0; i < HS_DPS; i++) {
      if (activeDrv[i]) {
        // open switch
        Wire.beginTransmission(addr);
        Wire.write((uint8_t)(1 << i));
        i2cRet = Wire.endTransmission();
        if (debug) {
          Serial.print("\n- opening switch #"); Serial.print(i, DEC);
          if (i2cRet == 0) {
            Serial.println("\t\t\tsuccess!");
          } else {
            Serial.println("\t\t\tERROR!");
          }
        }

        // reset driver
        Wire.beginTransmission(DRV2667_I2C_ADDRESS);
        Wire.write(DRV2667_REG02);
        Wire.write(DEV_RST);
        i2cRet = Wire.endTransmission();
        bool r0 = (i2cRet == 0) ? true : false;
        if (debug) {
          Serial.print("- resetting device");
          if (i2cRet == 0) {
            Serial.println("\t\t\tsuccess!");
          } else {
            Serial.println("\t\t\tERROR!");
          }
        }

        if (r0) retVal |= (1 << i);
        else retVal &= ~(1 << i);
      }
    }

    // close switch
    Wire.beginTransmission(addr);
    Wire.write(0);
    i2cRet = Wire.endTransmission();
    if (debug) {
      Serial.print("\n- closing i2c switch");
      if (i2cRet == 0) {
        Serial.println("\t\t\tsuccess!\n");
      } else {
        Serial.println("\t\t\tERROR!\n");
      }
    }
  }

  // ...switch on
  if (on) {
    if (debug) {
      Serial.println("Starting up drv2667...");
      Serial.print("- addressing i2c switch @ 0x"); Serial.println(addr, HEX);
    }

    // open each i2c switch channel and send settings to the attached drv2667
    for (uint8_t i = 0; i < HS_DPS; i++) {
      if (activeDrv[i]) {
        // open switch
        Wire.beginTransmission(addr);
        Wire.write((uint8_t)(1 << i));
        i2cRet = Wire.endTransmission();
        if (debug) {
          Serial.print("\n- opening switch #"); Serial.print(i, DEC);
          if (i2cRet == 0) {
            Serial.println("\t\t\tsuccess!");
          } else {
            Serial.println("\t\t\tERROR!");
          }
        }

        // wake up
        Wire.beginTransmission(DRV2667_I2C_ADDRESS);
        Wire.write(DRV2667_REG02);
        Wire.write(GO);
        i2cRet = Wire.endTransmission();
        bool r0 = (i2cRet == 0) ? true : false;
        if (debug) {
          Serial.print("- waking up");
          if (i2cRet == 0) {
            Serial.println("\t\t\t\t\tsuccess!");
          } else {
            Serial.println("\t\t\t\t\tERROR!");
          }
        }

        // set mux & gain
        Wire.beginTransmission(DRV2667_I2C_ADDRESS);
        Wire.write(DRV2667_REG01);
        Wire.write(INPUT_MUX | gain);
        i2cRet = Wire.endTransmission();
        bool r1 = (i2cRet == 0) ? true : false;
        if (debug) {
          Serial.print("- setting MUX&GAIN to 0x:"); Serial.print((INPUT_MUX | gain), HEX);
          if (i2cRet == 0) {
            Serial.println("\tsuccess!");
          } else {
            Serial.println("\tERROR!");
          }
        }

        // enable amplifier
        Wire.beginTransmission(DRV2667_I2C_ADDRESS);
        Wire.write(DRV2667_REG02);
        Wire.write(EN_OVERRIDE);
        i2cRet = Wire.endTransmission();
        bool r2 = (i2cRet == 0) ? true : false;
        if (debug) {
          Serial.print("- enabling amplifier");
          if (i2cRet == 0) {
            Serial.println("\t\t\tsuccess!");
          } else {
            Serial.println("\t\t\tERROR!");
          }
        }

        if (r0 && r1 && r2) retVal |= (1 << i);
        else retVal &= ~(1 << i);
      }
    }

    // close i2c switch
    Wire.beginTransmission(addr);
    Wire.write(0);
    i2cRet = Wire.endTransmission();
    // initOk = ((retVal == 0) && (initOk == true)) ? true : false;
    if (debug) {
      Serial.print("\n- closing i2c switch");
      if (i2cRet == 0) {
        Serial.println("\t\t\tsuccess!");
      } else {
        Serial.println("\t\t\tERROR!");
      }
    }


  }
  // ...switch off
  else {
    if (debug) {
      Serial.println("Switching off drv2667...");
      Serial.print("- addressing i2c switch @ 0x"); Serial.println(addr, HEX);
    }

    // open each i2c switch channel and send standby command to the attached drv2667
    for (uint8_t i = 0; i < HS_DPS; i++) {
      if (activeDrv[i]) {
        // open switch
        Wire.beginTransmission(addr);
        Wire.write((uint8_t)(1 << i));
        i2cRet = Wire.endTransmission();
        if (debug) {
          Serial.print("\n- opening switch #"); Serial.print(i, DEC);
          if (i2cRet == 0) {
            Serial.println("\t\t\tsuccess!");
          } else {
            Serial.println("\t\t\tERROR!");
          }
        }

        Wire.beginTransmission(DRV2667_I2C_ADDRESS);
        Wire.write(DRV2667_REG02);
        Wire.write(STANDBY);
        i2cRet = Wire.endTransmission();
        bool r0 = (i2cRet == 0) ? true : false;
        if (debug) {
          Serial.print("- standing by");
          if (i2cRet == 0) {
            Serial.println("\t\t\tsuccess!");
          } else {
            Serial.println("\t\t\tERROR!");
          }
        }

        if (r0) retVal |= (1 << i);
        else retVal &= ~(1 << i);
      }
    }

    // close i2c switch
    Wire.beginTransmission(addr);
    Wire.write(0);
    i2cRet = Wire.endTransmission();
    // initOk = ((retVal == 0) && (initOk == true)) ? true : false;
    if (debug) {
      Serial.print("\n- closing i2c switch");
      if (i2cRet == 0) {
        Serial.println("\t\t\tsuccess!");
      } else {
        Serial.println("\t\t\tERROR!");
      }
    }
  }

  return retVal;
}


/* -------------------------------------------------------------------------- */
/* -------------------------------------------------------------------------- */
/* | piezoSend																| */
/* -------------------------------------------------------------------------- */
/* -------------------------------------------------------------------------- */
void piezoSend(uint32_t val1, uint32_t val2, uint32_t val3)
{
	digitalWrite(LED3_PIN, LOW);		// notify SPI activity
	digitalWrite(LOAD_PIN, LOW);		// prepare LOAD pin
	digitalWrite(CLR_PIN, LOW);			// reset all shift registers
	digitalWrite(CLR_PIN, HIGH);		// ...
	
	SPI.beginTransaction(settingsA);	// start the SPI transaction with saved settings
	SPI.transfer((uint8_t)(val3));
	SPI.transfer((uint8_t)(val2 >> 24));
	SPI.transfer((uint8_t)(val2 >> 16));
	SPI.transfer((uint8_t)(val2 >> 8));
	SPI.transfer((uint8_t)(val2));
	SPI.transfer((uint8_t)(val1 >> 24));
	SPI.transfer((uint8_t)(val1 >> 16));
	SPI.transfer((uint8_t)(val1 >> 8));
	SPI.transfer((uint8_t)(val1));
	SPI.endTransaction();
	
	if(debug) {
		Serial.print("Sending to shift registers:\nb'");
		Serial.print((uint8_t)(val3), BIN); Serial.print(" ");
		Serial.print((uint8_t)(val2 >> 24), BIN); Serial.print(" ");
		Serial.print((uint8_t)(val2 >> 16), BIN); Serial.print(" ");
		Serial.print((uint8_t)(val2 >> 8), BIN); Serial.print(" ");
		Serial.print((uint8_t)(val2), BIN); Serial.print(" ");
		Serial.print((uint8_t)(val1 >> 24), BIN); Serial.print(" ");
		Serial.print((uint8_t)(val1 >> 16), BIN); Serial.print(" ");
		Serial.print((uint8_t)(val1 >> 8), BIN); Serial.print(" ");
		Serial.print((uint8_t)(val1), BIN); Serial.println("'");
		
		Serial.print("0x   "); Serial.print((uint8_t)val3, HEX);
		Serial.print("       "); Serial.print((uint8_t)(val2 >> 24), HEX);
		Serial.print("       "); Serial.print((uint8_t)(val2 >> 16), HEX);
		Serial.print("       "); Serial.print((uint8_t)(val2 >> 8), HEX);
		Serial.print("       "); Serial.print((uint8_t)(val2), HEX);
		Serial.print("       "); Serial.print((uint8_t)(val1 >> 24), HEX);
		Serial.print("       "); Serial.print((uint8_t)(val1 >> 16), HEX);
		Serial.print("       "); Serial.print((uint8_t)(val1 >> 8), HEX);
		Serial.print("       "); Serial.println((uint8_t)(val1), HEX);
	}
	
	digitalWrite(LOAD_PIN, HIGH);		// generate rising edge on LOAD pin
	digitalWrite(LED3_PIN, HIGH);		// stop SPI activity notification
}
