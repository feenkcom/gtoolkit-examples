*GToolkit-Examples-Core
gtExampleSubstrings
	^ ((self substrings: ' .,;') 
		collect: [ :each | each trimBoth ])
		reject: [ :each | each isEmptyOrNil ]