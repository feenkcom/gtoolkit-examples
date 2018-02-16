execution
executeOnExampleGroup: aGtExampleGroup 
	| results |
	results := Dictionary new.
	aGtExampleGroup examples 
		do: [ :eachExampleWithResult | 
			eachExampleWithResult run.
			results at: eachExampleWithResult put: eachExampleWithResult example returnValue ]
		displayingProgress: [ :examples | 
			'Processing ' , aGtExampleGroup examples size asString , ' examples ...' ].
	results inspect.