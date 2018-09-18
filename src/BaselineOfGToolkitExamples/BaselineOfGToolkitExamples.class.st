"
This baseline loads the complete GToolkit Examples project. This includes the basic engine (see ${class:BaselineOfGToolkitExamples}$ for specifying examples, the tests,  the available user interface components, as well as the defined examples.

Learn about example-driven development by following the introductory tutorial:
${inputFile:path=pharo-local/iceberg/feenkcom/gtoolkit-examples/doc/tutorial/examples-tutorial.pillar}$

"
Class {
	#name : #BaselineOfGToolkitExamples,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkitExamples
}

{ #category : #baseline }
BaselineOfGToolkitExamples >> baseline: spec [
	<baseline>
	spec for: #common do: [ 
		spec baseline: 'GToolkitExamplesEngine' with: [ spec 
				repository: 'github://feenkcom/gtoolkit-examples/src' ].
		spec
			package: 'GToolkit-Examples-Dummies' with: [ spec requires: #( 'GToolkitExamplesEngine' ) ];
			package: 'GToolkit-Examples-Roassal2UI' with: [ spec requires: #( 'GToolkitExamplesEngine' ) ];
			package: 'GToolkit-Examples-Extensions' with: [ spec requires: #( 'GToolkitExamplesEngine' ) ];
			package: 'GToolkit-Tests-Examples' with: [ 
				spec requires: #( 'GToolkitExamplesEngine' 'GToolkit-Examples-Extensions' 'GToolkit-Examples-Dummies' ) ].
	]

]
