Extension { #name : #ReflectiveMethod }

{ #category : #'*GToolkit-Examples-Extensions' }
ReflectiveMethod class >> gtExampleMethod [
	<gtExample>
	^ self on: (self class >> #gtExampleMethod)
]
