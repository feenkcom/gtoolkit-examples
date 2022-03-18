Extension { #name : #RGMethodDefinition }

{ #category : #'*GToolkit-Examples-Extensions' }
RGMethodDefinition class >> gtExampleMethod [
	<gtExample>
	<label: 'RMethodDefinition'>
	
	^ (GtInspector class >> #gtExtensionsFor:) asRingDefinition
]
