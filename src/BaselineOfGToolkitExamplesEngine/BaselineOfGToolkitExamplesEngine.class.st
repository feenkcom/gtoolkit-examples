"
This baseline is used to load the core of the GToolkit Examples project, together with a basic minimal interface. The 'Core' group can be used to avoid loading the user interface at all.

Packages:
${example:name=BaselineOfGToolkitExamplesEngine class>>#itself|show=gtPackagesFor:|expandedPreview=|noCode=}$
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
		spec
			package: 'GToolkit-Examples';
			package: 'GToolkit-Examples-UI' with: [ spec requires: #('GToolkit-Examples') ].			
	].
	spec for: #'pharo6.x' do: [ 
		spec
			package: 'GToolkit-Examples-UI-Nautilus'.			
	].

	spec for: #Calypso do: [ 
			spec package: 'GToolkit-Examples-Calypso' with: [ spec 
				requires: #( 'GToolkit-Examples' ) ].
		]
]

{ #category : #accessing }
BaselineOfGToolkitExamplesEngine >> customProjectAttributes [
	^ Smalltalk globals 
		at: #ClyBrowser 
		ifPresent: [ #( #Calypso ) ]
		ifAbsent: [ #() ]
]
