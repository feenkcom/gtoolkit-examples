Extension { #name : #OCAbstractScope }

{ #category : #'*GToolkit-Examples-Extensions' }
OCAbstractScope class >> gtExampleMethodScope [
	<gtExample>
	<label: 'Method scope'>
	
	^ (self class >> #gtExampleMethodScope) ast scope
]
