Class {
	#name : #GtDummyExamplesWithSubjects,
	#superclass : #GtAbstractDummyExamples,
	#category : #'GToolkit-Examples-Dummies-Data'
}

{ #category : #examples }
GtDummyExamplesWithSubjects >> classSubject [
	<gtExample>
	<subjectClass: 'GtExample'>
	
	self assert: self gtExampleRuntimeContext example subjects first class = GtExampleClassSubject.
	self assert: self gtExampleRuntimeContext example subjects first theClassName = 'GtExample'.
	self assert: self gtExampleRuntimeContext example subjects first theClass = GtExample.
	self assert: self gtExampleRuntimeContext example subjects first exists.
	
	^ 0
]
