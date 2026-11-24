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
	spec
		for: #common
		do: [ spec
				baseline: 'GToolkitExamples'
					with: [ spec repository: 'github://feenkcom/gtoolkit-examples:main/src' ];
				baseline: 'XMLParserForGlamorousToolkit'
					with: [ spec repository: 'github://feenkcom/XML-XMLParser:gt/src' ];
				baseline: 'GToolkitBasicUtility'
					with: [ spec repository: 'github://feenkcom/gtoolkit-utility:main/src' ].

			spec
				package: 'GToolkit-Examples-JUnit'
				with: [ spec
						requires: #('GToolkitExamples' 'XMLParserForGlamorousToolkit' 'GToolkitBasicUtility') ] ]
]
