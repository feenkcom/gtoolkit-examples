Class {
	#name : #GtDummyExamplesWithAfterInstanceSide,
	#superclass : #GtAbstractDummyExamples,
	#instVars : [
		'afterExecution'
	],
	#category : #'GToolkit-Examples-Dummies-Data'
}

{ #category : #examples }
GtDummyExamplesWithAfterInstanceSide >> a [
	" START -> C B A -> afterA -> afterB -> afterC -> END "

	<gtExample>
	<after: #afterA>
	<return: #GtExampleRuntimeContext>
	self b.

	self assert: (self gtExampleRuntimeContext includesKey: #c).
	self assert: (self gtExampleRuntimeContext includesKey: #c2).
	self assert: (self gtExampleRuntimeContext includesKey: #b).
	self assert: (self gtExampleRuntimeContext includesKey: #b2).

	self gtExampleRuntimeContext at: #a put: #a.
	self gtExampleRuntimeContext at: #a2 put: #a2.

	self gtExampleRuntimeContext at: #self ifAbsentPut: [ self ].

	^ self gtExampleRuntimeContext
]

{ #category : #after }
GtDummyExamplesWithAfterInstanceSide >> afterA [
	self assert: (self gtExampleRuntimeContext includesKey: #a).
	self assert: (self gtExampleRuntimeContext includesKey: #a2).
	self assert: (self gtExampleRuntimeContext includesKey: #b).
	self assert: (self gtExampleRuntimeContext includesKey: #b2).
	self assert: (self gtExampleRuntimeContext includesKey: #c).
	self assert: (self gtExampleRuntimeContext includesKey: #c2).
	
	self gtExampleRuntimeContext removeKey: #a.
	
	self assert: (self gtExampleRuntimeContext includesKey: #a) not.
	self assert: (self gtExampleRuntimeContext includesKey: #a2).
	self assert: (self gtExampleRuntimeContext includesKey: #b).
	self assert: (self gtExampleRuntimeContext includesKey: #b2).
	self assert: (self gtExampleRuntimeContext includesKey: #c).
	self assert: (self gtExampleRuntimeContext includesKey: #c2).
	
	(self gtExampleRuntimeContext at: #execution ifAbsentPut: [ OrderedCollection new ])
		add: #afterA.
	afterExecution add: #afterA
]

{ #category : #after }
GtDummyExamplesWithAfterInstanceSide >> afterB [
	self assert: (self gtExampleRuntimeContext includesKey: #a) not.
	self assert: (self gtExampleRuntimeContext includesKey: #b).
	self assert: (self gtExampleRuntimeContext includesKey: #b2).
	self assert: (self gtExampleRuntimeContext includesKey: #c).
	self assert: (self gtExampleRuntimeContext includesKey: #c2).
	
	self gtExampleRuntimeContext removeKey: #b.
	
	self assert: (self gtExampleRuntimeContext includesKey: #b) not.
	self assert: (self gtExampleRuntimeContext includesKey: #b2).
	self assert: (self gtExampleRuntimeContext includesKey: #c).
	self assert: (self gtExampleRuntimeContext includesKey: #c2).
	
	(self gtExampleRuntimeContext at: #execution ifAbsentPut: [ OrderedCollection new ])
		add: #afterB.
	afterExecution add: #afterB
]

{ #category : #after }
GtDummyExamplesWithAfterInstanceSide >> afterC [	
	self assert: (self gtExampleRuntimeContext includesKey: #a) not.
	self assert: (self gtExampleRuntimeContext includesKey: #b) not.
	self assert: (self gtExampleRuntimeContext includesKey: #c).
	self assert: (self gtExampleRuntimeContext includesKey: #c2).
	
	self gtExampleRuntimeContext removeKey: #c.
	
	self assert: (self gtExampleRuntimeContext includesKey: #c) not.
	self assert: (self gtExampleRuntimeContext includesKey: #c2).
	
	(self gtExampleRuntimeContext at: #execution ifAbsentPut: [ OrderedCollection new ])
		add: #afterC.
	afterExecution add: #afterC
]

{ #category : #after }
GtDummyExamplesWithAfterInstanceSide >> afterD [
	self assert: (self gtExampleRuntimeContext includesKey: #a) not.
	self assert: (self gtExampleRuntimeContext includesKey: #b) not.
	self assert: (self gtExampleRuntimeContext includesKey: #c) not.
	self assert: (self gtExampleRuntimeContext includesKey: #d).
	self assert: (self gtExampleRuntimeContext includesKey: #d2).
	
	self gtExampleRuntimeContext removeKey: #d.
	
	self assert: (self gtExampleRuntimeContext includesKey: #d) not.
	self assert: (self gtExampleRuntimeContext includesKey: #d2).
	
	(self gtExampleRuntimeContext at: #execution ifAbsentPut: [ OrderedCollection new ])
		add: #afterD.
	afterExecution add: #afterD
]

{ #category : #accessing }
GtDummyExamplesWithAfterInstanceSide >> afterExecution [
	^ afterExecution
]

{ #category : #examples }
GtDummyExamplesWithAfterInstanceSide >> b [
	" START -> C B -> afterB -> afterC -> END "

	<gtExample>
	<after: #afterB>
	<return: #GtExampleRuntimeContext>
	self c.

	self assert: (self gtExampleRuntimeContext includesKey: #c).
	self assert: (self gtExampleRuntimeContext includesKey: #c2).

	self gtExampleRuntimeContext at: #b put: #b.
	self gtExampleRuntimeContext at: #b2 put: #b2.

	self assert: (self gtExampleRuntimeContext at: #b) = #b.
	self assert: (self gtExampleRuntimeContext at: #b2) = #b2.

	self gtExampleRuntimeContext at: #self ifAbsentPut: [ self ].

	^ self gtExampleRuntimeContext
]

{ #category : #examples }
GtDummyExamplesWithAfterInstanceSide >> c [
	" START -> C -> afterC -> END "

	<gtExample>
	<after: #afterC>
	<return: #GtExampleRuntimeContext>
	self gtExampleRuntimeContext at: #c put: #c.
	self gtExampleRuntimeContext at: #c2 put: #c2.

	self assert: (self gtExampleRuntimeContext at: #c) = #c.
	self assert: (self gtExampleRuntimeContext at: #c2) = #c2.

	self gtExampleRuntimeContext at: #self ifAbsentPut: [ self ].

	^ self gtExampleRuntimeContext
]

{ #category : #initialization }
GtDummyExamplesWithAfterInstanceSide >> initialize [
	super initialize.
	afterExecution := OrderedCollection new.
]
