Extension { #name : #GlobalVariable }

{ #category : #'*GToolkit-Examples-Extensions' }
GlobalVariable class >> gtExampleSmalltalk [
	<gtExample>
	^ Smalltalk globals associations detect: [:assoc | assoc key = #Smalltalk ]
]
