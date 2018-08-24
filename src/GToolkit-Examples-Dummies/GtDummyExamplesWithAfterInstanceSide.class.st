Class {
	#name : #GtDummyExamplesWithAfterInstanceSide,
	#superclass : #GtAbstractDummyExamples,
	#instVars : [
		'afterExecution'
	],
	#category : 'GToolkit-Examples-Dummies-Data'
}

{ #category : #examples }
GtDummyExamplesWithAfterInstanceSide >> a [
	<gtExample>
	<after: #afterA>
	" START -> C B A -> afterA -> afterB -> afterC -> END "
	
	self b.
	
	self assert: (self gtExampleContext includesKey: #c).
	self assert: (self gtExampleContext includesKey: #c2).
	self assert: (self gtExampleContext includesKey: #b).
	self assert: (self gtExampleContext includesKey: #b2).
	
	self gtExampleContext at: #a put: #a.
	self gtExampleContext at: #a2 put: #a2.
	
	self gtExampleContext at: #self ifAbsentPut: [self].
	
	^ self gtExampleContext
]

{ #category : #after }
GtDummyExamplesWithAfterInstanceSide >> afterA [
	self assert: (self gtExampleContext includesKey: #a).
	self assert: (self gtExampleContext includesKey: #a2).
	self assert: (self gtExampleContext includesKey: #b).
	self assert: (self gtExampleContext includesKey: #b2).
	self assert: (self gtExampleContext includesKey: #c).
	self assert: (self gtExampleContext includesKey: #c2).
	
	self gtExampleContext removeKey: #a.
	
	self assert: (self gtExampleContext includesKey: #a) not.
	self assert: (self gtExampleContext includesKey: #a2).
	self assert: (self gtExampleContext includesKey: #b).
	self assert: (self gtExampleContext includesKey: #b2).
	self assert: (self gtExampleContext includesKey: #c).
	self assert: (self gtExampleContext includesKey: #c2).
	
	(self gtExampleContext at: #execution ifAbsentPut: [ OrderedCollection new ])
		add: #afterA.
	afterExecution add: #afterA
]

{ #category : #after }
GtDummyExamplesWithAfterInstanceSide >> afterB [
	self assert: (self gtExampleContext includesKey: #a) not.
	self assert: (self gtExampleContext includesKey: #b).
	self assert: (self gtExampleContext includesKey: #b2).
	self assert: (self gtExampleContext includesKey: #c).
	self assert: (self gtExampleContext includesKey: #c2).
	
	self gtExampleContext removeKey: #b.
	
	self assert: (self gtExampleContext includesKey: #b) not.
	self assert: (self gtExampleContext includesKey: #b2).
	self assert: (self gtExampleContext includesKey: #c).
	self assert: (self gtExampleContext includesKey: #c2).
	
	(self gtExampleContext at: #execution ifAbsentPut: [ OrderedCollection new ])
		add: #afterB.
	afterExecution add: #afterB
]

{ #category : #after }
GtDummyExamplesWithAfterInstanceSide >> afterC [	
	self assert: (self gtExampleContext includesKey: #a) not.
	self assert: (self gtExampleContext includesKey: #b) not.
	self assert: (self gtExampleContext includesKey: #c).
	self assert: (self gtExampleContext includesKey: #c2).
	
	self gtExampleContext removeKey: #c.
	
	self assert: (self gtExampleContext includesKey: #c) not.
	self assert: (self gtExampleContext includesKey: #c2).
	
	(self gtExampleContext at: #execution ifAbsentPut: [ OrderedCollection new ])
		add: #afterC.
	afterExecution add: #afterC
]

{ #category : #accessing }
GtDummyExamplesWithAfterInstanceSide >> afterExecution [
	^ afterExecution
]

{ #category : #examples }
GtDummyExamplesWithAfterInstanceSide >> b [
	<gtExample>
	<after: #afterB>
	" START -> C B -> afterB -> afterC -> END "
	
	self c.
	
	self assert: (self gtExampleContext includesKey: #c).
	self assert: (self gtExampleContext includesKey: #c2).
	
	self gtExampleContext at: #b put: #b.
	self gtExampleContext at: #b2 put: #b2.
	
	self assert: ((self gtExampleContext at: #b) = #b).
	self assert: ((self gtExampleContext at: #b2) = #b2).
	
	self gtExampleContext at: #self ifAbsentPut: [self].
	
	^ self gtExampleContext
]

{ #category : #examples }
GtDummyExamplesWithAfterInstanceSide >> c [
	<gtExample>
	<after: #afterC>
	" START -> C -> afterC -> END "
	
	self gtExampleContext at: #c put: #c.
	self gtExampleContext at: #c2 put: #c2.
	
	self assert: ((self gtExampleContext at: #c) = #c).
	self assert: ((self gtExampleContext at: #c2) = #c2).
	
	self gtExampleContext at: #self ifAbsentPut: [self].
	
	^ self gtExampleContext
]

{ #category : #initialization }
GtDummyExamplesWithAfterInstanceSide >> initialize [
	super initialize.
	afterExecution := OrderedCollection new.
]
