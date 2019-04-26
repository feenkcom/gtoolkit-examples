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

{ #category : #initialization }
GtParametrizedExample >> initialize [
	super initialize.
	arguments := #().
]
