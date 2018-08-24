Extension { #name : #RGMethodDefinition }

{ #category : #'*GToolkit-Examples-Extensions' }
RGMethodDefinition class >> gtExampleMethod [
	<gtExample>
	<label: 'RMethodDefinition'>
	
	^ (GTInspector class >> #gtInspectorExtensionsIn:) asRingDefinition
]
