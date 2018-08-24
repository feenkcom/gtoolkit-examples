Extension { #name : #GtExampleMethodIcon }

{ #category : #'*GToolkit-Examples-Extensions' }
GtExampleMethodIcon class >> exampleFromBase64String [
	<gtExample>
	^ (GtExampleMethodIcon fromClass: GtExampleFormIcon class selector: #dataFromBase64String) converter: #convertFromBase64String:
]

{ #category : #'*GToolkit-Examples-Extensions' }
GtExampleMethodIcon class >> exampleFromByteArray [
	<gtExample>
	^ (GtExampleMethodIcon fromClass: GtExampleFormIcon class selector: #dataFromByteArray) converter: #convertFromByteArray:
]
