Extension { #name : #GtExampleClassSubject }

{ #category : #'*GToolkit-Examples-Extensions' }
GtExampleClassSubject class >> exampleFromClass [
	<gtExample>
	^ GtExampleClassSubject fromClass: Magnitude
]

{ #category : #'*GToolkit-Examples-Extensions' }
GtExampleClassSubject class >> exampleFromClassNamed [
	<gtExample>
	^ GtExampleClassSubject fromClassNamed: 'Magnitude'
]
