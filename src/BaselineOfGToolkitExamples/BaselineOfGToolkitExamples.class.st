"
This baseline loads the complete GToolkit Examples project. This includes the basic engine (see {{gtClass:BaselineOfGToolkitExamplesEngine}} for specifying examples, the tests,  the available user interface components, as well as the defined examples.

1. # Learn

Learn about example-driven development by following the introductory tutorial:
[examples-tutorial.pillar](fileLocator://gtResource/feenkcom/gtoolkit-examples/doc/tutorial/examples-tutorial.pillar)


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
	spec for: #'common' do: [
		spec
			baseline: 'GToolkitExamplesEngine' with: [
				spec repository: 'github://feenkcom/gtoolkit-examples:v0.8.95/src' ].

		spec package: 'GToolkit-Examples-Dummies' with: [
			spec requires: #('GToolkitExamplesEngine') ].
		spec package: 'GToolkit-Examples-Dummies-Package1' with: [
			spec requires: #('GToolkitExamplesEngine') ].
		spec package: 'GToolkit-Examples-Dummies-Package2' with: [
			spec requires: #('GToolkitExamplesEngine' 'GToolkit-Examples-Dummies-Package1') ].
		spec package: 'GToolkit-Examples-Dummies-Package3' with: [
			spec requires: #('GToolkitExamplesEngine' 'GToolkit-Examples-Dummies-Package1' 'GToolkit-Examples-Dummies-Package2') ].
		spec package: 'GToolkit-Examples-Dummies-Package4' with: [
			spec requires: #('GToolkitExamplesEngine') ].
		spec package: 'GToolkit-Examples-Dummies-Package5' with: [
			spec requires: #('GToolkitExamplesEngine') ].
		spec package: 'GToolkit-Examples-Dummies-Package6' with: [
			spec requires: #('GToolkitExamplesEngine') ].
		spec package: 'GToolkit-Examples-Dummies-Package7' with: [
			spec requires: #('GToolkitExamplesEngine') ].
		spec package: 'GToolkit-Examples-Roassal2UI' with: [
			spec requires: #('GToolkitExamplesEngine') ].
		spec package: 'GToolkit-Examples-Extensions' with: [
			spec requires: #('GToolkitExamplesEngine') ].
		spec package: 'GToolkit-Tests-Examples' with: [
			spec requires: #('GToolkitExamplesEngine' 'GToolkit-Examples-Extensions' 'GToolkit-Examples-Dummies') ].
	]
]
