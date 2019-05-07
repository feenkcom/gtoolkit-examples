Class {
	#name : #GtParametrizedExample,
	#superclass : #GtExample,
	#instVars : [
		'arguments'
	],
	#category : #'GToolkit-Examples-Core'
}

{ #category : #accessing }
GtParametrizedExample >> arguments [
	^ arguments
]

{ #category : #accessing }
GtParametrizedExample >> arguments: anObject [
	arguments := anObject
]

{ #category : #testing }
GtParametrizedExample >> canBeExecuted [
	"Return true if example can be executed"
	<return: #Boolean>
	^ super canBeExecuted and: [ self hasEnoughArguments ]
]

{ #category : #accessing }
GtParametrizedExample >> changeArguments: aCollection [
	"Indicate whether arguments were changed"
	<return: #Boolean>
	self arguments = aCollection ifTrue: [ ^ false ].
	self arguments: aCollection.
	^ true
]

{ #category : #'accessing-dynamic' }
GtParametrizedExample >> evaluationContext [
	<return: #GtExampleEvaluationContext>
	^ GtExampleEvaluationContext new 
			provider: self provider;
			arguments: self arguments
]

{ #category : #accessing }
GtParametrizedExample >> gtArgumentsFor: aView [ 
	<gtView>
	self arguments ifNil: [ ^ aView empty ].
	^ aView list 
		title: 'Arguments';
		priority: 5;
		items: [ self arguments ]
]

{ #category : #testing }
GtParametrizedExample >> hasEnoughArguments [
	^ self arguments size = self numberOfRequieredArguments
]

{ #category : #initialization }
GtParametrizedExample >> initialize [
	super initialize.
	arguments := #().
]

{ #category : #accessing }
GtParametrizedExample >> numberOfRequieredArguments [
	^ self method numArgs
]
