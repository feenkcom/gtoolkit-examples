"
I include a model to parse JUnit XML result reports.
"
Class {
	#name : #ManifestGToolkitExamplesJUnit,
	#superclass : #PackageManifest,
	#category : #'GToolkit-Examples-JUnit-Manifest'
}

{ #category : #accessing }
ManifestGToolkitExamplesJUnit class >> mustOnlyDependOn [
	^ {'Collections-Sequenceable'.
		'Kernel'.
		'XML-Parser'}
]
