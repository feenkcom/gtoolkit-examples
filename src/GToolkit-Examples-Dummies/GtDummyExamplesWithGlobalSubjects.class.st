Class {
	#name : #GtDummyExamplesWithGlobalSubjects,
	#superclass : #GtAbstractDummyExamples,
	#category : 'GToolkit-Examples-Dummies-Data'
}

{ #category : #examples }
GtDummyExamplesWithGlobalSubjects class >> classSideSubjects1 [
	<gtExample>
	
	self assert: self gtExampleContext example subjects first class equals: GtExampleClassSubject.
	self assert: self gtExampleContext example subjects first theClassName equals: 'GtExample'.
	self assert: self gtExampleContext example subjects first theClass equals: GtExample.
	self assert: self gtExampleContext example subjects first exists.
	
	^ 0
]

{ #category : #examples }
GtDummyExamplesWithGlobalSubjects class >> classSideSubjects2 [
	<gtExample>
	
	self assert: self gtExampleContext example subjects first class equals: GtExampleClassSubject.
	self assert: self gtExampleContext example subjects first theClassName equals: 'GtExample'.
	self assert: self gtExampleContext example subjects first theClass equals: GtExample.
	self assert: self gtExampleContext example subjects first exists.
	
	^ 0
]

{ #category : #config }
GtDummyExamplesWithGlobalSubjects class >> gtExamplesSubjects [
	^ { GtExample }
]

{ #category : #config }
GtDummyExamplesWithGlobalSubjects >> gtExamplesSubjects [
	^ { Object. Array. GtExample }
]

{ #category : #examples }
GtDummyExamplesWithGlobalSubjects >> multipleSubjects1 [
	<gtExample>
	
	self assert: self gtExampleContext example subjects size = 3.
	self assert: (self gtExampleContext example subjects allSatisfy: [ :each | each exists ]).
	self gtExamplesSubjects do: [ :each |
		self assert: (self gtExampleContext example hasSubject: (self class gtExamplesFactoryClass subjectFrom: each)) ].
	
	^ 0
]

{ #category : #examples }
GtDummyExamplesWithGlobalSubjects >> multipleSubjects2 [
	<gtExample>
	
	self assert: self gtExampleContext example subjects size = 3.
	self assert: (self gtExampleContext example subjects allSatisfy: [ :each | each exists ]).
	self gtExamplesSubjects do: [ :each |
		self assert: (self gtExampleContext example hasSubject: (self class gtExamplesFactoryClass subjectFrom: each)) ].
	
	^ 0
]

{ #category : #examples }
GtDummyExamplesWithGlobalSubjects >> multipleSubjects3 [
	<gtExample>
	
	self assert: self gtExampleContext example subjects size = 3.
	self assert: (self gtExampleContext example subjects allSatisfy: [ :each | each exists ]).
	self gtExamplesSubjects do: [ :each |
		self assert: (self gtExampleContext example hasSubject: (self class gtExamplesFactoryClass subjectFrom: each)) ].
	
	^ 0
]
