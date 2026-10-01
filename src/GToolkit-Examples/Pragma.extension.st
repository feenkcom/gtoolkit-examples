Extension { #name : #Pragma }

{ #category : #'*GToolkit-Examples' }
Pragma >> isGTExamplePragma [
	<gsCode: '^ self keyword = #gtExample or: [ self keyword = #gtExample: ]'>
	^ self selector = #gtExample or: [ self selector = #gtExample: ]
]
