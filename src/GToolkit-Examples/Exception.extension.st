Extension { #name : #Exception }

{ #category : #'*GToolkit-Examples' }
Exception >> isGtExampleFailure [
	"Answer a boolean indicating whether the receiver is considered to be an example failure, as opposed to an error.
	There are multiple implementers of #assert:description: that return different exceptions, thus the exception class can't be counted on to determine what is a failure."

	^ false
]
