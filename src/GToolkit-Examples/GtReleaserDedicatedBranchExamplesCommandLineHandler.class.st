Class {
	#name : #GtReleaserDedicatedBranchExamplesCommandLineHandler,
	#superclass : #GtExamplesCommandLineHandler,
	#category : #'GToolkit-Examples-Testing'
}

{ #category : #accessing }
GtReleaserDedicatedBranchExamplesCommandLineHandler class >> commandName [
	^ 'dedicatedReleaseBranchExamples'
]

{ #category : #accessing }
GtReleaserDedicatedBranchExamplesCommandLineHandler >> packages [
	^ GtRlReleaserExportWorkflow allExamplePackagesInDedicatedReleaseRepositories collect: [:p | p name]
]
