Class {
	#name : #GtDummyExamplesWithSubjectsAndGlobalSubjects,
	#superclass : #GtAbstractDummyExamples,
	#category : 'GToolkit-Examples-Dummies-Data'
}

{ #category : #config }
GtDummyExamplesWithSubjectsAndGlobalSubjects >> gtExamplesSubjects [
	^ { Object. Array }
]

{ #category : #examples }
GtDummyExamplesWithSubjectsAndGlobalSubjects >> multipleSubjects1 [
	<gtExample>
	<subjectClass: 'GtExample'>
	<subjectClass: #GtExample>
	
	self assert: self gtExampleContext example subjects size equals: 3.
	self assert: (self gtExampleContext example subjects select: [ :each | each exists ]) size equals: 3.
	
	^ 0
]

{ #category : #examples }
GtDummyExamplesWithSubjectsAndGlobalSubjects >> multipleSubjects2 [
	<gtExample>
	<subject: 'GtExample'> 
	<subjectClass: 'Object'> " overlap "
	<subjectClass: #Array> " overlap "
	
	self assert: self gtExampleContext example subjects size equals: 3.
	self assert: (self gtExampleContext example subjects select: [ :each | each exists ]) size equals: 3.
	
	^ 0
]
