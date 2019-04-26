Class {
	#name : #GtDummyExamplesWithSubjectsAndGlobalSubjects,
	#superclass : #GtAbstractDummyExamples,
	#category : #'GToolkit-Examples-Dummies-Data'
}

{ #category : #config }
GtDummyExamplesWithSubjectsAndGlobalSubjects class >> gtExamplesSubjects [
	^ { Object. Array }
]

{ #category : #examples }
GtDummyExamplesWithSubjectsAndGlobalSubjects >> multipleSubjects1 [
	<gtExample>
	<subjectClass: 'GtExample'>
	<subjectClass: #GtExample>
	
	self assert: self gtExampleRuntimeContext example subjects size equals: 3.
	self assert: (self gtExampleRuntimeContext example subjects select: [ :each | each exists ]) size equals: 3.
	
	^ 0
]

{ #category : #examples }
GtDummyExamplesWithSubjectsAndGlobalSubjects >> multipleSubjects2 [
	<gtExample>
	<subject: 'GtExample'> 
	<subjectClass: 'Object'> " overlap "
	<subjectClass: #Array> " overlap "
	
	self assert: self gtExampleRuntimeContext example subjects size equals: 3.
	self assert: (self gtExampleRuntimeContext example subjects select: [ :each | each exists ]) size equals: 3.
	
	^ 0
]
