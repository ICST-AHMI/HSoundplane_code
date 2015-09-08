// Arduino Byte Serial Receiver
// Martin Fröhlich, ICST (2015)

#define CMDLIST_BEGIN       253
#define CMDLIST_END         255

int started = 0; // flag for whether we've received serial yet

// Allocate 250 bytes for all possible commands
// that can occur in one commandlist. The limitation of 250 comes
// from the fact that the protocol requires the values 253 and 255 as
// beginning rsp. ending, and the second byte is providing the length of all
// commandbytes, which can not exceed 252 otherwise it will be in conflict with
// beginning and ending bytes.
byte cmd[25 * 5 * 2]; 

void setup()
{
	Serial.begin(9600); // open the arduino serial port
}

byte slaveUsed[4];
int cmdListSize;
int cmdIndex;
 
void loop()
{
	byte c;
	if(Serial.available()) // check to see if there's serial data in the buffer
	{
		//Protocol:series of bytes: <begin> <size> <x1> <y1> (<x2> <y2> <x3> <y3>) <end>
		// where <begin> = 253
		//       <size> = 2 ... max. 250
		//       <x>    = 0 ... 29 while 100 = switch off all piezo
		//       <y>    = 0 ... 4  while 0 = all piezos of all slaves, 1 = slave 1..
		//       <end>  = 255
    
		c = Serial.read(); // read a byte of serial data

		if(started == 1){
			// it is the size byte. check if it is <= 250 and even.
			if(c <= 250 && (c % 2) == 0){
				cmdListSize = c;
			} else {
				cmdListSize = 0;
				//Serial.write(2); // send error 2
				Serial.println("odd length"); // print a line-feed
			}
      
			started = 0;
		} else if(c == CMDLIST_BEGIN){
			// start of a command-list was received
			cmdIndex = 0;
			started = 1;
			for(int i = 0; i < 4; i++){
				slaveUsed[i] == 0;
			}
		} else if (c == CMDLIST_END){
			// end of a command-list was received
      
			// check if all commands have arrived:
			if(cmdIndex != 0 && cmdIndex == cmdListSize){ 
				// FIRST send the command to the respective slave
				for(int i = 0; i < cmdListSize; i = i + 2){
					// check if it is a normal piezo command
					if(cmd[i] < 30){
						// register if the command belonged to a slave:
						slaveUsed[cmd[i] / 8] = 1;
              
						//send command to slave:
						//sendToSlave(cmd[i] / 8 + 1, cmd[i], cmd[i+1]);
					} else if(cmd[i] == 100){
						//switchOffSlave(cmd[i+1] + 1);
					}
              
				}
 
				// SECOND switch off all unused slaves:
				for(int i = 0; i < 4; i++){
					if(slaveUsed[i] == 0){
						// send slave a ALL PIEZO OFF Command 
						//switchOffSlave(i+1)
					}        
				}
				// Serial.write(0); // send zero when all is clear
				Serial.println("OK"); // print a line-feed
			} else {
				//Serial.write(1); // send error 1
				Serial.println("length mismatch"); // print a line-feed
			}
		} else {
			// store the byte in its respective index.
			if(cmdIndex < cmdListSize)
				cmd[cmdIndex++] = c;
		}
	}
}
