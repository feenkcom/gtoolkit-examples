Extension { #name : #MetacelloSpec }

{ #category : #'*GToolkit-Examples-Extensions' }
MetacelloSpec class >> gtExampleMetacelloSpec [
	<gtExample>
	<label: 'Metacello group reference'>
	
	^ (ConfigurationOfGTInspectorCore project version: #development) groups anyOne
]
