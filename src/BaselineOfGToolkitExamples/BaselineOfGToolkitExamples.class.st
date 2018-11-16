"
This baseline loads the complete GToolkit Examples project. This includes the basic engine (see ${class:BaselineOfGToolkitExamplesEngine}$ for specifying examples, the tests,  the available user interface components, as well as the defined examples.

!!Learn
Learn about example-driven development by following the introductory tutorial:
${icebergFile:path=feenkcom/gtoolkit-examples/doc/tutorial/examples-tutorial.pillar}$

!!Included projects
${example:name=BaselineOfGToolkitExamples class>>#itself|previewShow=#gtProjectsFor:|noCode=}$

"
Class {
	#name : #BaselineOfGToolkitExamples,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkitExamples
}

{ #category : #accessing }
BaselineOfGToolkitExamples class >> itself [
	<gtExample>
	^ self
]

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
