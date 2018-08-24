"
This baseline is used to load the core of the GToolkit Examples project, together with a basic minimal interface. The 'Core' group can be used to avoid loading the user interface at all.

Depends on:
- has no dependencies

Load type: 
- linear

Installs:
- GToolkit-Examples
- GToolkit-Examples-UI
"
Class {
	#name : #BaselineOfGToolkitExamplesEngine,
	#superclass : #BaselineOf,
	#category : 'BaselineOfGToolkitExamplesEngine'
}

{ #category : #baseline }
BaselineOfGToolkitExamplesEngine >> baseline: spec [
	<baseline>
	spec for: #common do: [ 
		spec
			package: 'GToolkit-Examples';
			package: 'GToolkit-Examples-UI' with: [ spec requires: #('GToolkit-Examples') ].			
	].
	spec for: #'pharo6.x' do: [ 
		spec
			package: 'GToolkit-Examples-UI-Nautilus'.			
	]
]
