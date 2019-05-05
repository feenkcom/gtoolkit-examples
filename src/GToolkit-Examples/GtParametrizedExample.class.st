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

{ #category : #initialization }
GtParametrizedExample >> initialize [
	super initialize.
	arguments := #().
]

{ #category : #accessing }
GtParametrizedExample >> numberOfRequieredArguments [
	^ self method numArgs
]
