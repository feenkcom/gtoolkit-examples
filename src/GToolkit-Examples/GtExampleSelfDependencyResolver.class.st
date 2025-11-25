"
I detect if a self send is a dependency to an example.


"
Class {
	#name : #GtExampleSelfDependencyResolver,
	#superclass : #GtExampleDependencyResolver,
	#category : 'GToolkit-Examples-Organization'
}

{ #category : #testing }
GtExampleSelfDependencyResolver >> appliesTo: anASTNode [
	^ anASTNode isMessage and: [ anASTNode isSelfSend ]
]

{ #category : #action }
GtExampleSelfDependencyResolver >> posibleExampleForNode: aMessageNode fromMethod: aCompiledMethod forOriginalExample: anOriginalExample [
	| possibleExampleMethod |
	possibleExampleMethod := anOriginalExample providerClass
		lookupSelector: aMessageNode selector.
	^ possibleExampleMethod ifNotNil: [ :aPossibleExampleMethod |
		self 
			exampleFromMethod: aPossibleExampleMethod
			withProviderClass: anOriginalExample providerClass ]
]
