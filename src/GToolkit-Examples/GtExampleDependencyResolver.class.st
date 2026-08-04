"
I define a heuristic for determining if a given AST node represents a dependency to an example. I define only the main API. My subclasses  define concrete heuristic.


"
Class {
	#name : #GtExampleDependencyResolver,
	#superclass : #Object,
	#category : #'GToolkit-Examples-Organization'
}

{ #category : #testing }
GtExampleDependencyResolver >> appliesTo: anASTNode [
	self subclassResponsibility
]

{ #category : #private }
GtExampleDependencyResolver >> exampleFromMethod: aCompiledMethod [
	^ self 
		exampleFromMethod: aCompiledMethod 
		withReceiverClass: aCompiledMethod methodClass
]

{ #category : #private }
GtExampleDependencyResolver >> exampleFromMethod: aCompiledMethod withReceiverClass: aReceiverClass [
	self flag: 'figure out how to remove the if statements'.
	
	^ aCompiledMethod isGTExampleMethod 
		ifTrue: [ aCompiledMethod gtExamplesFactory
			createExampleForMethod: aCompiledMethod 
			withReceiverClass: aReceiverClass ]
		ifFalse: [ aCompiledMethod isGTParametrizedExampleMethod 
			ifTrue: [ aCompiledMethod gtParametrizedExamplesFactory
				createExampleForMethod: aCompiledMethod 
				withReceiverClass: aReceiverClass ] 
			ifFalse: [ nil ] ]
]

{ #category : #action }
GtExampleDependencyResolver >> posibleExampleForNode: aMessageNode fromMethod: aCompiledMethod forOriginalExample: anOriginalExample [
	self subclassResponsibility
]
