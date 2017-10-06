private
beginExample: anExample runBlock: aBlock
	| time |
	progressFile 
		nextPutAll: 'starting example: ';
		nextPutAll: anExample methodClass name;
		nextPutAll: '>>';
		nextPutAll: anExample selector.
	progressFile nextPutAll: ' ... '; flush.
	time := aBlock timeToRun.
	stream tab; 
		nextPutAll: '<testcase classname="'; 
		nextPutAll: (self encode: (anExample methodClass category copyReplaceAll: '-' with: '.')); 
		nextPut: $.; nextPutAll: (self encode: anExample methodClass name); 
		nextPutAll: '" name="'; nextPutAll: (self encode: anExample selector); 
		nextPutAll: '" time="'; print: (time asMilliSeconds / 1000.0); 
		nextPutAll: '">'; lf
	
