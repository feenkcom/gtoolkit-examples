*GToolkit-Examples-Core
gtExampleSubstrings
	^ (self gather: [ :each | each gtExampleSubstrings ])
		reject: [ :each | each isEmptyOrNil ]