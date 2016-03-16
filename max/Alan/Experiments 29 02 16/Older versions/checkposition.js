// checkposition.js
//
// at each pointer movement from one tile to another, check if it's on track or not


inlets = 1;

outlets = 1;

// global vars

autowatch = 1;  //js code is refreshed in Max patch at every change
//immediate = 1; //code is executed in hi-priority thread (seems like)

var errSize = 0;
var track = [];
var currPos = [];  //current pointer position: [column, row]
var args = [];
var matched = false;  //whether current position matches any part of the track


function list(input){
	//receive input
	args = arrayfromargs(arguments);
	//first two elements are current position
	currPos = args.slice(0,2);
	//the remaining elements are current track
	track = args.slice(2,65);

	
	
}

function msg_int( incoming ) {}

function bang(){
	//outlet(0, currPos[0]);
	if ((currPos[0] < 33)&&(currPos[1] < 6)) {
		matchTrack();
	}  
}

function matchTrack(){
	
	matched = false;
	
 /* 	for (i = 0; i = track.length; i=i+2){
		 if (currPos[0] == track[i]) {
			errSize = abs(currPos[1]-track[i+1]);
			if (errSize == 0) {
				matched = true;
				break;
				} 
			} 
	}  */
	
	outlet (0, track.length);
}



//if (currPos == [255, 255]) return;