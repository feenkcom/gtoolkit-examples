Extension { #name : #MorphicUIManager }

{ #category : #'*GToolkit-Examples-UI' }
MorphicUIManager >> gtInform: aStringOrText send: aSelector to: anObject withValue: anArgument [
	"Display a message for the user to read and then dismiss."
	(ProvideAnswerNotification signal: aStringOrText) ifNotNil: [ :answer | ^ self ].
	(GrowlMorph 
		openWithLabel: 'Information' translated 
		contents: aStringOrText)
			on: #mouseDown send: aSelector to: anObject withValue: anArgument.
]
