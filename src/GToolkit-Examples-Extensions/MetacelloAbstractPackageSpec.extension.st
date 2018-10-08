Extension { #name : #MetacelloAbstractPackageSpec }

{ #category : #'*GToolkit-Examples-Extensions' }
MetacelloAbstractPackageSpec class >> gtExamplePackageReference [
	<gtExample>
	
	^ BaselineOfGToolkitExamples project versions first packages first
]
