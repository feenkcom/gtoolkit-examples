Extension { #name : #MetacelloAbstractPackageSpec }

{ #category : #'*GToolkit-Examples-Extensions' }
MetacelloAbstractPackageSpec class >> gtExampleGroupSpec [
	<gtExample>
	<label: 'Metacello package reference'>
	
	^ BaselineOfGToolkitExamples project versions first groups first
]
