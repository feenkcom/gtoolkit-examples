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
GtExampleDependencyResolver >> exampleFromMethod: aMethod [
	self flag: 'figure out how to remove the if statements'.
	^ aMethod isGTExampleMethod 
		ifTrue: [ aMethod  gtExample ]
		ifFalse: [ aMethod isGTParametrizedExampleMethod 
			ifTrue: [ aMethod gtParametrizedExample ] 
			ifFalse: [ nil ] ]
]

{ #category : #action }
GtExampleDependencyResolver >> posibleExampleForNode: aMessageNode fromMethod: aCompiledMethod [
	self subclassResponsibility
]
