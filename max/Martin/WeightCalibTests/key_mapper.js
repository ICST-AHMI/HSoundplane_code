autowatch = 0;

var myid=0;

outlets = 5;
setinletassist(0,"input");
setoutletassist(2,"number of primes(int)");
setoutletassist(1,"is prime(int)");
setoutletassist(0,"number(int)");


if (jsarguments.length>1)
	myid = jsarguments[1];


var THRESHOLD_X = 0.5;
var THRESHOLD_Y = 0.9;

var fingerLost = 0;

var outArray = new Array();

function list()
{
	var a = arrayfromargs(messagename, arguments);
	
	var x = a[0] / 0.0333;
	var y = (1 - a[1])/0.2;
	var z = a[2];

	if(z > 0.){
		outlet(4, "data", x, y, a[0], a[1], a[2], a[3]);
	
		// chops of the fractions
		var x_int = parseInt(x);
		var y_int = parseInt(y);
	
		// graduation with 1. in the center of the key and 0. at the border
		var x_grad = 1. - Math.abs((x - x_int) - 0.5) * 2.0;
		var y_grad = 1. - Math.abs((y - y_int) - 0.5) * 2.0;
	
		// calculates the next closest key in each direction
		var x_next = ((x - x_int) > 0.5)? x_int + 1: x_int -1;
		var y_next = ((y - y_int) > 0.5)? y_int + 1: y_int -1;

	
		// open the main key
		outlet(0, x_int, y_int);
		
		outArray = new Array(-1, -1, -1, -1, -1, -1, -1, -1);
		
		outArray[0] = x_int;
		outArray[1] = y_int;
		
		if(x_grad < THRESHOLD_X && y_grad < THRESHOLD_Y && ( x_next >= 0 && x_next <= 29 ) && ( y_next >= 0 && y_next <= 4 )){
			// open the diagonal key
			//outlet(1, x_next, y_next);
			outArray[2] = x_next;
			outArray[3] = y_next;
		} 
		if(x_grad < THRESHOLD_X && ( x_next >= 0 && x_next <= 29 )) {
			// open the left / right key
			//outlet(3, x_next, y_int);
			outArray[4] = x_next;
			outArray[5] = y_int;
		} 
		outlet(2,y_grad);
		outlet(3,y_next);
		if(y_grad < THRESHOLD_Y && ( y_next >= 0 && y_next <= 4 )) {
			// open the upper / lower key
			//outlet(3, x_int, y_next);
			outArray[6] = x_int;
			outArray[7] = y_next;
		}
		outlet(1, outArray);
	}
}
