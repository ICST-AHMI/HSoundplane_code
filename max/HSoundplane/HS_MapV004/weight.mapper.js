autowatch = 1;

var myid=0;

outlets = 1;
setinletassist(0,"orig list");
setoutletassist(0,"new list");


if (jsarguments.length>1)
	myid = jsarguments[1];


var THRESHOLD_X = 0.5;
var THRESHOLD_Y = 0.9;

var fingerLost = 0;

var outArray = new Array();

var weightMatrix = new JitterMatrix(3,"float32",30,5);

weightMatrix.read("weight.bogus.matrix.jxf.jit");


function bang(){
	post("get cell " + weightMatrix.getcell(0.,0.) + "\n");
}

function anything()
{
	var messg = messagename;
	
	var a = arrayfromargs(arguments);
	
	var x = a[0] / 0.0333;
	var y = (1 - a[1])/0.2;
	var z = a[2];

	if(z > 0.){		
		var z_weight = z;

		// chops of the fractions
		var x_int = Math.min(parseInt(x), 29.);
		var y_int = Math.min(parseInt(y), 4.);
	
		// graduation with 1. in the center of the key and 0. at the border
		var x_grad = 1. - Math.abs((x - x_int) - 0.5);
		var y_grad = 1. - Math.abs((y - y_int) - 0.5);
	
		// calculates the next closest key in each direction
		var x_next = ((x - x_int) > 0.5)? x_int + 1: x_int -1;
		var y_next = ((y - y_int) > 0.5)? y_int + 1: y_int -1;
		
		x_next = Math.min(Math.max(x_next, 0), 29);
		y_next = Math.min(Math.max(y_next, 0), 4);
		
		outArray = new Array(-1, -1, -1, -1, -1, -1, -1, -1);

//		post("get cell " + weightMatrix.getcell(0.,0.) + "\n");
//		post("weight = " + x_int + " " + y_int + " / " + weightMatrix.getcell(x_int , y_int) + "\n");
		
		var weight00 =  getWeight(z, weightMatrix.getcell(x_int , y_int));
		var weight01 =  getWeight(z, weightMatrix.getcell(x_next, y_int));
		var weight10 =  getWeight(z, weightMatrix.getcell(x_int , y_next));
		var weight11 =  getWeight(z, weightMatrix.getcell(x_next, y_next));
		
		var finalW = ((weight00 * x_grad + (weight01 + weight11)/2. * (1.- x_grad)) + 
					  (weight00 * y_grad + (weight10 + weight11)/2. * (1.- y_grad)))/2.;

		outlet(0, messg, a[0], a[1], a[2], a[3], x, y, finalW, x_int, y_int, x_grad, y_grad, x_next, y_next);
		
//		post("weight = " + z + " / " + finalW + "\n");
		
	} else {
		outlet(0, messg, a[0], a[1], a[2], a[3]);
	}	
}

function getWeight(z, calib){
	if(z < calib[0])
		return 0. * (1. - (z / calib[0])) + 100. * (z / calib[0]);
	if(z < calib[1])
		return 100. * (1. - (z - calib[0]) / (calib[1] - calib[0])) + 200. * ((z - calib[0]) / (calib[1] - calib[0]));
	if(z < calib[2])
		return 200. * (1. - (z - calib[1]) / (calib[2] - calib[1])) + 350 * ((z - calib[1]) / (calib[2] - calib[1]));
	return 400;
}
