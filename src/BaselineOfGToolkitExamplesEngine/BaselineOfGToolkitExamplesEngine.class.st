"
This baseline is used to load the core of the GToolkit Examples project, together with a basic minimal interface. The 'Core' group can be used to avoid loading the user interface at all.

Packages:
{{gtExample:name=BaselineOfGToolkitExamplesEngine class>>#itself|previewShow=gtPackagesFor:|previewExpanded=|noCode=}}


"
Class {
	#name : #BaselineOfGToolkitExamplesEngine,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkitExamplesEngine
}

{ #category : #accessing }
BaselineOfGToolkitExamplesEngine class >> itself [
	<gtExample>
	^ self
]

{ #category : #baseline }
BaselineOfGToolkitExamplesEngine >> baseline: spec [
	<baseline>
	spec for: #common do: [ 
		spec package: 'GToolkit-Examples' ].
]
