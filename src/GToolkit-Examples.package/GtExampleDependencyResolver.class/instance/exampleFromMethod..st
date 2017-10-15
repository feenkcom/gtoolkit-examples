private
exampleFromMethod: aMethod
	^ aMethod isGTExampleMethod 
		ifTrue: [ aMethod  gtExample ]
		ifFalse: [ nil ]