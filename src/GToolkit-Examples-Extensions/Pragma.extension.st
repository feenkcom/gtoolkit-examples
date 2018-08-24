Extension { #name : #Pragma }

{ #category : #'*GToolkit-Examples-Extensions' }
Pragma class >> gtExamplePragma [
	<gtExample>
	<label: 'Pragma'>
	
	^ (Pragma class >> #gtExamplePragma) pragmas anyOne
]
