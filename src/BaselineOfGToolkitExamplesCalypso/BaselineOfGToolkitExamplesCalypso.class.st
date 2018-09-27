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
			baseline: 'GToolkitExamples' with: [ 
				spec repository: 'github://feenkcom/gtoolkit-examples/src' ];
			package: 'GToolkit-Examples-Calypso' with: [ 
				spec requires: #( 'GToolkitExamples' ) ]
	].

	spec for: #'pharo6.x' do: [ 
		spec 
			baseline: 'Calypso' with: [ 
				spec repository: 'github://dionisiydk/Calypso' ];
			package: 'GToolkit-Examples-Calypso' with: [ 
				spec requires: #( 'Calypso' ) ]
	]

]
