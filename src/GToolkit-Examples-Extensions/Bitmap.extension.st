Extension { #name : #Bitmap }

{ #category : #'*GToolkit-Examples-Extensions' }
Bitmap class >> gtExampleIconBits [
	<gtExample>
	<label: 'Icon bits'>
	^ (Smalltalk ui icons iconNamed: #pharoIcon) bits
]
