
/*
	simple mean calculation that works a bit different than the max mean object
*/

// global varables and code
inlets = 1;
var alwaysoutput = 0;
var v = new Array();


function msg_int(f)
{
	v.push(f);
}

function msg_float(f)
{
	v.push(f);
}

function start(){
	v = new Array();
}

function stop()
{
	var mean = 0;
	for(var i = 0; i < v.length; i++){
		mean += v[i];
	}
	outlet(0,mean / v.length);
	v = new Array();
}
