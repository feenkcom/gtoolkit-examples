Class {
	#name : 'GtExampleEvaluationContext',
	#superclass : 'Object',
	#instVars : [
		'arguments',
		'provider'
	],
	#category : 'GToolkit-Examples-Core'
}

{ #category : 'accessing' }
GtExampleEvaluationContext >> arguments [
	^ arguments
]

{ #category : 'accessing' }
GtExampleEvaluationContext >> arguments: anObject [
	arguments := anObject
]

{ #category : 'accessing' }
GtExampleEvaluationContext >> provider [
	^ provider
]

{ #category : 'accessing' }
GtExampleEvaluationContext >> provider: anObject [
	provider := anObject
]
