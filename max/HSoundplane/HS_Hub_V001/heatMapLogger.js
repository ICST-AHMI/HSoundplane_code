/*

simple example of reading and writing a file

*/

outlets = 1;

var myFilePath;
var myFile;
var isRead = false;
var isWrite = false;

function write(s)
{
	if(isRead){
		post("... closing logfile " + myFilePath + "\n");
		close();
	}
	myFilePath = s;
	myFile = new File(myFilePath,"write","TEXT"); 
	if (myFile.isopen) {
		myFile.position = myFile.eof;
		post("ready to write log to file: " + myFilePath + "\n");
	} else {
		post("could not create logfile: " + myFilePath + "\n");
	}
	isRead = false;
	isWrite = true;
}

function read(s)
{
	if(isWrite){
		post("... closing logfile " + myFilePath + "\n");
		close();
	}

	myFilePath = s;
	myFile = new File(myFilePath); 
	if (myFile.isopen) {
		post("ready to read data from logfile: " + myFilePath + "\n");
	} else {
		post("could not open logfile: " + myFilePath + "\n");
	}
	isRead = true;
	isWrite = false;
}

function log()
{
	if(isWrite){
		var s = arrayfromargs(arguments);
		if (myFile != null && myFile.isopen) {
			myFile.writeline(s.toString()); //writes a string
		} else {
			post("could not write to logfile: " + myFilePath + "\n");
		}
	}
}

function getlog()
{
	if(isRead){
		if (myFile != null && myFile.isopen) {
			var list;
			while ((a = myFile.readline()) != null) { // returns a string
				list = a.split(",");
				for(var i = 0; i < list.length; i++){
					list[i] = parseFloat(list[i]);
				}
				outlet(0, list);
				//post("log[" + i + "]: " + a + "\n");
			}
		} 	else {
			post("could not open logfile: " + myFilePath + "\n");
		}
	}
}


function close(){
	if (myFile != null && myFile.isopen) {
		myFile.close(); //writes a string
		post("... closing logfile: " + myFilePath + "\n");
	}
	isRead = false;
	isWrite = false;

}





function copyfile(src,dst)
{
	var i,a,c;
	var srcfile = new File(src,"read"); 
	if (srcfile.isopen) {
		var dstfile = new File(dst,"write",srcfile.filetype); 
		c = srcfile.eof;
		if (dstfile.isopen) {
			post("copying: " + src + " to " + dst + "\n");
			for (i=0;i<c;) {
				a = srcfile.readbytes(32); //returns array of bytes, in this case upto 32 at a time
				if (a.length) {
					dstfile.writebytes(a);
					i += a.length;
				} else {
					break; //shouldn't get here, but just incase
				}
			}
			dstfile.eof = c;
			dstfile.close();
		} else {
			post("could not create file: " + dst + "\n");
		}
		srcfile.close();
	} else {
		post("could not create file: " + src + "\n");
	}
}

