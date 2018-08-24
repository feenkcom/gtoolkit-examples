Extension { #name : #MetacelloProjectSpec }

{ #category : #'*GToolkit-Examples-Extensions' }
MetacelloProjectSpec class >> gtExampleMetacelloSpec [
	<gtExample>
	<label: 'Metacello project reference'>
	
	^ (ConfigurationOfGTInspectorCore project version: #development) projects anyOne
]
