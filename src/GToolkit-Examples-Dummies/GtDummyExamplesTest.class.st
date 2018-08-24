Class {
	#name : #GtDummyExamplesTest,
	#superclass : #TestCase,
	#category : 'GToolkit-Examples-Dummies-Tests'
}

{ #category : #accessing }
GtDummyExamplesTest >> allExamplesDummiesProviders [
	^ GtAbstractDummyExamples withAllSubclasses select: [ :each | 
		each isAbstract not ]
]

{ #category : #utils }
GtDummyExamplesTest >> examplesInClasses: aSelector do: aBlock [
	| classes examples |
	self shouldnt: [ classes  := (self perform: aSelector) ] raise: Error.
	self assert: classes notEmpty.
	classes do: [ :each |
		self shouldnt: [ examples := each gtExamples ] raise: Error.
		self assert: examples notEmpty.
		examples do: [ :example |
			self shouldnt: [ aBlock value: example ] raise: Error ] ]
]

{ #category : #accessing }
GtDummyExamplesTest >> invalidExamplesDummiesProviders [
	^ GtAbstractDummyExamples withAllSubclasses select: [ :each | 
		each isAbstract not 
			and: [ each isExpectedFailure ] ]
]

{ #category : #accessing }
GtDummyExamplesTest >> recursiveExamplesDummiesProviders [
	^ GtAbstractDummyExamples withAllSubclasses select: [ :each | 
		each isAbstract not 
			and: [ each isExpectedRecursion ] ]
]

{ #category : #tests }
GtDummyExamplesTest >> testExists [
	self examplesInClasses: #allExamplesDummiesProviders do: [ :example | 
		self assert: example exists ]
]

{ #category : #tests }
GtDummyExamplesTest >> testInvalidDefinitions [
	self examplesInClasses: #invalidExamplesDummiesProviders do: [ :example | 
		self assert: example exists.
		self deny: example isValid ]
]

{ #category : #tests }
GtDummyExamplesTest >> testIsEquals [
	self examplesInClasses: #allExamplesDummiesProviders do: [ :example | 
		self assert: (example = example) ]
]

{ #category : #tests }
GtDummyExamplesTest >> testIsGTExample [
	self examplesInClasses: #allExamplesDummiesProviders do: [ :example | 
		self assert: example isGTExample ]
]

{ #category : #tests }
GtDummyExamplesTest >> testMatchesMethod [
	self examplesInClasses: #allExamplesDummiesProviders do: [ :example | 
		self assert: (example matchesMethod: example method) ]
]

{ #category : #tests }
GtDummyExamplesTest >> testRecursiveDefinitions [
	self examplesInClasses: #recursiveExamplesDummiesProviders do: [ :example | 
		self assert: example exists.
		self assert: example hasValidDependencies.
		self assert: (example method selector = #h or: [ example isValid not ]) ]
]

{ #category : #tests }
GtDummyExamplesTest >> testResult [
	self examplesInClasses: #allExamplesDummiesProviders do: [ :example | 
		self shouldnt: [ example result ] raise: Error.
		self shouldnt: [ example returnValue ] raise: Error.
		self shouldnt: [ example result ] raise: Error.
		self shouldnt: [ example returnValue ] raise: Error. ]
]

{ #category : #tests }
GtDummyExamplesTest >> testRun [
	self examplesInClasses: #allExamplesDummiesProviders do: [ :example | 
		self shouldnt: [ example run ] raise: Error ]
]
