// hexcenters.js
//
// calculate center coords for hexagons in the pattern


//inlets: hexagon side, first hexagon (x,y)
//outlets: list of centers


inlets = 1;
outlets = 1;


// global vars

autowatch = 1;  //js code is refreshed in Max patch at every change
var inputList = [];
var centerList = [];
var centerPlainList = [];
var s, x, y = 0;

//respond to list input: store in a js array and call centers()
function list(input){
	inputList = arrayfromargs(arguments);
	centers(inputList[0], inputList[1], inputList[2]);
	bang();	
}


function centers(side, firstX, firstY)
{
	
	//first hex center
	//var valueToPush = [];
 	//valueToPush[0] = firstX;
	//valueToPush[1] = firstY;
	//centerList.push(valueToPush[y]);
	x = firstX;
	y = firstY;
//	centerList.push(x);
//	centerList.push(y);
//	centerList.push(0);
	
	for (i=0;i<31;i++)
	{	
	centerList.push(x);
	centerList.push(y);
	centerList.push(0);

		for (j=0;j<5;j++)
		{
			y += 2*side;
			centerList.push(x);
			centerList.push(y);
			centerList.push(0); //value for coordinate z, here always = 0
		}		
		x += Math.sqrt(3)*side;
	}
	
	
	
outlet(0, centerList);
	
	// for (j = 1; j < 5; j++)
	// {
		// valueToPush[0] = 0;
		// valueToPush[1] = centerList[0][j-1] + side * 2;
		// outlet(0, valueToPush);
		// centerList.push(valueToPush);
		// valueToPush = [];
	// }

 
	
	//var i = 0, j = 0, h = 0, k = 0;
	//5-hex columns
 	//for (i = 1; i < 32; i++){   		//32 columns (0-31, 0 already assigned)
	//	for (j = 1; j < 5; j++){		//5 rows (0-4, 0 already assigned)
        //    valueToPush[1] = centerList[0][j-1] + (Number(side) * 2);
		//	valueToPush[0] = 0;
		//	valueToPush[1] = centerList[j-1]+2*side;       //move down 2*side
		//	centerList.push(valueToPush);
	//	} 
	//	valueToPush[0] = centerList[i-1]+Math.sqrt(3)*side; //move right sqrt(3)*side
	//}
    //4-hex columns - TO DO
	
 	//collapse to 1-dim list
	/* for (i = 0; i < 32; i++){
		for (j = 0; j < 6; j++){
			centerPlainList.push(centerList[j,i]);
			}
	}    */
	
	
	 //outlet(0, centerList.length);
	// outlet(0, centerList[0][0]);
	// outlet(0, centerList[0][1]);
	// outlet(0, centerList[0][2]);
	// outlet(0, centerList[0][3]);
	 //outlet(0, centerList[2][0]);

	
	
	
	centerList = [];
	}
	
function bang()
{
	//post("s,x,y is");
	//post(inputList);
	// post();
	// post("centerList is");
	// post(centerList);
	// post();
	// post("centerPlainList is");
	// post();
}	