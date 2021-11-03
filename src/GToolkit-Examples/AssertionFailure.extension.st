Extension { #name : #AssertionFailure }

{ #category : #'*GToolkit-Examples' }
AssertionFailure >> asGtExampleResultValue [

	^ GtExampleResultFailureValue new failure: self
]
