"
I detect if a message send having the form  'ClassName new message'  is a dependency to an example.


"
Class {
	#name : #GtExampleExternalDependencyResolver,
	#superclass : #GtExampleDependencyResolver,
	#category : #'GToolkit-Examples-Organization'
}

{ #category : #testing }
GtExampleExternalDependencyResolver >> appliesTo: anASTNode [

	((anASTNode isKindOf: RBVariableNode)
		and: [ anASTNode isGlobal and: [ Smalltalk hasClassNamed: anASTNode name ] ])
		ifFalse: [ ^ false ].
	^ anASTNode parent notNil
		and: [ anASTNode parent isMessage
				and: [ anASTNode parent selector = #new
						and: [ anASTNode parent parent notNil and: [ anASTNode parent parent isMessage ] ] ] ]
]

{ #category : #action }
GtExampleExternalDependencyResolver >> posibleExampleForNode: aGlobalNode fromMethod: aCompiledMethod forOriginalExample: anOriginalExample [
	| targetClass possibleExampleMethod |
	targetClass := Smalltalk classNamed: aGlobalNode name.
	possibleExampleMethod := targetClass
		lookupSelector: aGlobalNode parent parent selector.
	^ possibleExampleMethod ifNotNil: [ :aPossibleExampleMethod | 
		self 
			exampleFromMethod: aPossibleExampleMethod
			withProviderClass: targetClass ]
]
