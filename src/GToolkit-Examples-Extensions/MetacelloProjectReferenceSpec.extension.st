Extension { #name : #MetacelloProjectReferenceSpec }

{ #category : #'*GToolkit-Examples-Extensions' }
MetacelloProjectReferenceSpec class >> gtExampleProjectReferenceSpec [
	<gtExample>
	<label: 'Metacello project reference'>
	
	^ (ConfigurationOfGTInspectorCore project version: #development) projects anyOne
]
