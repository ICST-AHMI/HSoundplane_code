//createtrials.js
//
//create random list of trials, each with a different feedback modality
// to avoid learning effect, two consecutive trials must not have the same feedback
//
//NOTE: this currently does not ensure equal distribution, only non-consecutiveness
//general solution: x(n+1) = [x(n) + rand(1,n-1)] mod n   <- effective for n big

inlets = 1;

outlets = 1;

// global vars

autowatch = 1;  //js code is refreshed in Max patch at every change
var trials, factorLevels = 0;
var inputs = [];
var singleTrial = [];

function list(input){
	//receive input
	inputs = arrayfromargs(arguments);
	//create coordinate track starting from start position
	trials = inputs[0];
	factorLevels = inputs[1];
	//IMPORTANT clean up list or next one gets appended
	singleTrial = [];
	createList();
	//bang();	
}


function createList(){
	//divide unity to evenly distribute probability among factor levels
	levelSize = 1/factorLevels;
	/*factorLevelCount = [];
	 for (i = 0; i < (factorLevels); i++){
		factorLevelCount.push(trials/factorLevels);
	} */ 
	
	modality = Math.floor(Math.random()/levelSize);
	singleTrial.push(modality);
	lastModality = modality;
	
	for (i = 1; i < trials; i++){
		//get random value until it is different from previous
		while(modality == lastModality){  //this generate loops
			modality = Math.floor(Math.random()/levelSize);  
		}		
		singleTrial.push(modality);
		//factorLevelCount[modality]--;
		lastModality = modality;	
	}
	
	outlet(0, singleTrial);
	
}
