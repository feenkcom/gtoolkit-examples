running
begin
	progressFile nextPutAll: 'running suite: ';
		nextPutAll: 'Examples' ; crlf; flush.
		
	stream := StandardFileStream forceNewFileNamed: 'Examples' , '-Test.xml'.
	stream := MultiByteFileStream newFrom: stream.
	stream nextPutAll: '<?xml version="1.0" encoding="UTF-8"?>'; lf.
	stream nextPutAll: '<testsuite name="'; nextPutAll: (self encode: 'Examples'); 
		nextPutAll: '" tests="'; print: examples size; nextPutAll: '">'.
	
	"Now this is ugly. We want to update the time and the number of failures and errors, but still at the same time stream a valid XML. So remember this position and add some whitespace, that we can fill later."
	examplesPosition := stream position - 1.
	stream nextPutAll: (String new: 100 withAll: $ ); lf