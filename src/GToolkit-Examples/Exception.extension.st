Extension { #name : #Exception }

{ #category : #'*GToolkit-Examples' }
Exception >> asGtExampleResultValue [

	^ GtExampleResultErrorValue new exception: self
]
