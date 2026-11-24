Class {
	#name : #BaselineOfGToolkitExamplesJUnit,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkitExamplesJUnit
}

{ #category : #accessing }
BaselineOfGToolkitExamplesJUnit class >> itself [
	<gtExample>
	^ self
]

{ #category : #baseline }
BaselineOfGToolkitExamplesJUnit >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec
			baseline: 'GToolkitExamples' with: [
				spec repository: 'github://feenkcom/gtoolkit-examples:v0.8.152/src' ].
		spec
			baseline: 'XMLParserForGlamorousToolkit' with: [
				spec repository: 'github://feenkcom/XML-XMLParser:v0.6.4/src' ].
		spec
			baseline: 'GToolkitBasicUtility' with: [
				spec repository: 'github://feenkcom/gtoolkit-utility:v0.9.75/src' ].

		spec package: 'GToolkit-Examples-JUnit' with: [
			spec requires: #(#GToolkitExamples #XMLParserForGlamorousToolkit #GToolkitBasicUtility) ].
	]
]
