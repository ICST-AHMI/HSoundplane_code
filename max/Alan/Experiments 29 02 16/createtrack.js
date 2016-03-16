// createtrack.js
//
//create a list of 30 random coordinates (x,y):
// - x(i) := x(i-1) + xShift where xShift = 0 || 1 (randomly chosen)
// - y(i) := y(i-1) + yShift where yShift = -1 || 0 || +1 (randomly chosen) 
//    note1: typically xShift = 1 (move strictly to the right)
//    note2: xShift and yShift can't be simultaneously = 0 (no movement)       

inlets = 1;

outlets = 1;

// global vars

autowatch = 1;  //js code is refreshed in Max patch at every change
var startCoordinate = [];
var track = [];
var x,y,xShift,yShift = 0;



function list(input){
	//receive input
	startCoordinate = arrayfromargs(arguments);
	//create coordinate track starting from start position
	newtrack(startCoordinate);
	//bang();	
}

//create track of trackLength (x,y) coordinates in a linear list [x1,y1,x2,y2,...xn,yn]
//standard case: xShift = 1
function newtrack(start){
//reset pre-existent track
	track.length = 0;
//load start coordinates;
	x = start[0];
	y = start[1];
	track.push(x);
	track.push(y);
	for (i = 0; i < 29; i++){
		xShift = 1; //substitute with random value if necessary
		x += xShift;
		yShift = randomShift("ternary");
		//if on bottom border, do not go any lower (yShift = -1 or 0)
		while ((y == 5) && (yShift == 1)) { 
			yShift = -(randomShift("binary"));
			}
		//if on top border, do not go any higher (yShift = 0 or 1)
		while ((y == 1) && (yShift == -1)) { 
			yShift = randomShift("binary");
			}

		y += yShift;
		track.push(x);
		track.push(y);
	}
	
	outlet(0, track);
}	

//calculate random value: "binary" 0||1, "ternary" -1||0||1	
function randomShift(mode){
	var randNum = 0;
	
	randNum = Math.random();
	
	//binary mode: output = 0 or 1
	if (mode == "binary"){
		if (randNum < 0.50){
			randNum = 0;
		} else randNum = 1;
	}
	
	//ternary mode: output = -1 or 0 or 1
	if (mode == "ternary"){
		if (randNum < 0.33) {
			randNum = -1;
		} else if (randNum < 0.66) {
			randNum = 0;
		} else randNum = 1;
	}
	return randNum;
	
}

	
	
	
	
