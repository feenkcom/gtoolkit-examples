Class {
	#name : #BaselineOfGToolkitExamplesCalypso,
	#superclass : #BaselineOf,
	#category : 'BaselineOfGToolkitExamplesCalypso'
}

{ #category : #baseline }
BaselineOfGToolkitExamplesCalypso >> baseline: spec [
	<baseline>
	spec for: #common do: [ 
		spec 
			baseline: 'Calypso' with: [ 
				spec repository: 'github://dionisiydk/Calypso' ];
			baseline: 'GToolkitExamples' with: [ 
				spec repository: 'github://feenkcom/gtoolkit-examples/src' ];
			package: 'GToolkit-Examples-Calypso' with: [ 
				spec requires: #( 'GToolkitExamples' 'Calypso' ) ]
	]

]
