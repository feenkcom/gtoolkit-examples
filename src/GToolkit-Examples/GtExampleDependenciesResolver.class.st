"
I know how to extract the dependencies of a given example. The dependencies of a given example consists in message sends to other method constructing an example. 

To determine if a message send represents a dependency to a method containing an example, I use heuristic defined by subclasses of `GtExampleDependencyResolver`. 


"
Class {
	#name : #GtExampleDependenciesResolver,
	#superclass : #Object,
	#instVars : [
		'resolvers'
	],
	#classInstVars : [
		'instance'
	],
	#category : 'GToolkit-Examples-Organization'
}

{ #category : #accessing }
GtExampleDependenciesResolver class >> default [
	^ instance ifNil: [ instance := self new ]
]

{ #category : #cleanup }
GtExampleDependenciesResolver class >> reset [
	instance := nil
]

{ #category : #actions }
GtExampleDependenciesResolver class >> resolveDependenciesForExample: anExample [
	^ self default resolveDependenciesForExample: anExample
]

{ #category : #'system startup' }
GtExampleDependenciesResolver class >> startUp [

	self reset
]

{ #category : #accessing }
GtExampleDependenciesResolver >> dependencyResolvers [
	^ resolvers
]

{ #category : #accessing }
GtExampleDependenciesResolver >> gtViewDependencyResolversFor: aView [
	<gtView>
	
	^ aView forward 
		title: 'Dependency Resolvers';
		object: [ self dependencyResolvers ];
		view: #gtItemsFor:
]

{ #category : #initialization }
GtExampleDependenciesResolver >> initialize [
	super initialize.
	resolvers := { 
		GtExampleSelfDependencyResolver new .
		GtExampleSuperDependencyResolver new .
		GtExampleExternalDependencyResolver new }
]

{ #category : #actions }
GtExampleDependenciesResolver >> resolveDependenciesForExample: anExample [
	| exampleDependencies |
	
	exampleDependencies := OrderedCollection new.
	anExample methodDo: [ :aMethod | 
		aMethod ast nodesDo: [ :aNode | 
			self 
				withDependencyExampleFrom: aNode 
				fromMethod: aMethod 
				forOriginalExample: anExample 
				ifPresentDo:  [ :possibleExampleDependency |
					exampleDependencies 
						detect: [ :anotherExample | 
							anotherExample = possibleExampleDependency ]
						ifNone: [ 
							exampleDependencies add: possibleExampleDependency ] ] ] ].
	
	^ exampleDependencies
]

{ #category : #'private - iterating' }
GtExampleDependenciesResolver >> withDependencyExampleFrom: anASTNode fromMethod: aCompiledMethod forOriginalExample: anOriginalExample ifPresentDo: anActionBlock [

	self dependencyResolvers 
		detect: [ :aResolver | aResolver appliesTo: anASTNode ]
		ifFound: [ :aResolver | 
			(aResolver 
				posibleExampleForNode: anASTNode 
				fromMethod: aCompiledMethod
				forOriginalExample: anOriginalExample) 
					ifNotNil: [ :anExample | anActionBlock value: anExample ]  ]
]
