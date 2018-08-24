Extension { #name : #MetacelloVersion }

{ #category : #'*GToolkit-Examples-Extensions' }
MetacelloVersion class >> gtExampleMetacelloBaselineVersion [
	<gtExample>
	<label: 'Metacello Version'>
	
	^ BaselineOfGToolkitExamples project versions first
]
