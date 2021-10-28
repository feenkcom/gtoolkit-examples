Extension { #name : #Pragma }

{ #category : #'*GToolkit-Examples-Core' }
Pragma >> isGTExamplePragma [
	<toBeDeprecated: #gtExample:>
	^ self selector = #gtExample or: [ self selector = #gtExample: ]
]
