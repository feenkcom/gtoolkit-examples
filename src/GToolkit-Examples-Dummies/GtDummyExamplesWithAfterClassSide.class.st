Class {
	#name : #GtDummyExamplesWithAfterClassSide,
	#superclass : #GtAbstractDummyExamples,
	#category : #'GToolkit-Examples-Dummies-Data'
}

{ #category : #examples }
GtDummyExamplesWithAfterClassSide class >> a [
	<gtExample>
	<after: #afterA>
	" START -> C B A -> afterA -> afterB -> afterC -> END "
	
	self b.
	
	self assert: (self gtExampleRuntimeContext includesKey: #c).
	self assert: (self gtExampleRuntimeContext includesKey: #c2).
	self assert: (self gtExampleRuntimeContext includesKey: #b).
	self assert: (self gtExampleRuntimeContext includesKey: #b2).
	
	self gtExampleRuntimeContext at: #a put: #a.
	self gtExampleRuntimeContext at: #a2 put: #a2.
	
	^ self gtExampleRuntimeContext
]

{ #category : #after }
GtDummyExamplesWithAfterClassSide class >> afterA [
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
		add: #afterA
]

{ #category : #after }
GtDummyExamplesWithAfterClassSide class >> afterB [
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
		add: #afterB
]

{ #category : #after }
GtDummyExamplesWithAfterClassSide class >> afterC [	
	self assert: (self gtExampleRuntimeContext includesKey: #a) not.
	self assert: (self gtExampleRuntimeContext includesKey: #b) not.
	self assert: (self gtExampleRuntimeContext includesKey: #c).
	self assert: (self gtExampleRuntimeContext includesKey: #c2).
	
	self gtExampleRuntimeContext removeKey: #c.
	
	self assert: (self gtExampleRuntimeContext includesKey: #c) not.
	self assert: (self gtExampleRuntimeContext includesKey: #c2).
	
	(self gtExampleRuntimeContext at: #execution ifAbsentPut: [ OrderedCollection new ])
		add: #afterC
]

{ #category : #examples }
GtDummyExamplesWithAfterClassSide class >> b [
	<gtExample>
	<after: #afterB>
	" START -> C B -> afterB -> afterC -> END "
	
	self c.
	
	self assert: (self gtExampleRuntimeContext includesKey: #c).
	self assert: (self gtExampleRuntimeContext includesKey: #c2).
	
	self gtExampleRuntimeContext at: #b put: #b.
	self gtExampleRuntimeContext at: #b2 put: #b2.
	
	self assert: ((self gtExampleRuntimeContext at: #b) = #b).
	self assert: ((self gtExampleRuntimeContext at: #b2) = #b2).
	
	^ self gtExampleRuntimeContext
]

{ #category : #examples }
GtDummyExamplesWithAfterClassSide class >> c [
	<gtExample>
	<after: #afterC>
	" START -> C -> afterC -> END "
	
	self gtExampleRuntimeContext at: #c put: #c.
	self gtExampleRuntimeContext at: #c2 put: #c2.
	
	self assert: ((self gtExampleRuntimeContext at: #c) = #c).
	self assert: ((self gtExampleRuntimeContext at: #c2) = #c2).
	
	^ self gtExampleRuntimeContext
]
