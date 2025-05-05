Class {
	#name : #GtDummyExamplesWithGlobalSubjects,
	#superclass : #GtAbstractDummyExamples,
	#category : #'GToolkit-Examples-Dummies-Data'
}

{ #category : #examples }
GtDummyExamplesWithGlobalSubjects class >> classSideSubjects1 [
	<gtExample>
	
	self assert: self gtExampleRuntimeContext example subjects first class equals: GtExampleClassSubject.
	self assert: self gtExampleRuntimeContext example subjects first theClassName equals: 'GtDummyExamplesWithGlobalSubjects'.
	self assert: self gtExampleRuntimeContext example subjects first theClass equals: GtDummyExamplesWithGlobalSubjects.
	self assert: self gtExampleRuntimeContext example subjects first exists.
	
	^ 0
]

{ #category : #examples }
GtDummyExamplesWithGlobalSubjects class >> classSideSubjects2 [
	<gtExample>
	
	self assert: self gtExampleRuntimeContext example subjects first class equals: GtExampleClassSubject.
	self assert: self gtExampleRuntimeContext example subjects first theClassName equals: 'GtDummyExamplesWithGlobalSubjects'.
	self assert: self gtExampleRuntimeContext example subjects first theClass equals: GtDummyExamplesWithGlobalSubjects.
	self assert: self gtExampleRuntimeContext example subjects first exists.
	
	^ 0
]

{ #category : #config }
GtDummyExamplesWithGlobalSubjects class >> gtExamplesSubjects [
	^ { Object. Array. GtExample }
]

{ #category : #examples }
GtDummyExamplesWithGlobalSubjects >> multipleSubjects1 [
	<gtExample>
	<return: #SmallInteger>
	| example |
	example := self gtExampleRuntimeContext example.
	self assert: example subjects size = 3.
	self assert: (example subjects allSatisfy: [ :each | each exists ]).
	self class gtExamplesSubjects
		do: [ :each | 
			self
				assert: (example hasSubject: (self class gtExamplesFactoryClass subjectFrom: each)) ].

	^ 0
]

{ #category : #examples }
GtDummyExamplesWithGlobalSubjects >> multipleSubjects2 [
	<gtExample>
	<return: #SmallInteger>
	self assert: self gtExampleRuntimeContext example subjects size = 3.
	self
		assert: (self gtExampleRuntimeContext example subjects
				allSatisfy: [ :each | each exists ]).
	self class gtExamplesSubjects
		do: [ :each | 
			self
				assert: (self gtExampleRuntimeContext example
						hasSubject: (self class gtExamplesFactoryClass subjectFrom: each)) ].

	^ 0
]

{ #category : #examples }
GtDummyExamplesWithGlobalSubjects >> multipleSubjects3 [
	<gtExample>
	<return: #SmallInteger>
	self assert: self gtExampleRuntimeContext example subjects size = 3.
	self
		assert: (self gtExampleRuntimeContext example subjects
				allSatisfy: [ :each | each exists ]).
	self class gtExamplesSubjects
		do: [ :each | 
			self
				assert: (self gtExampleRuntimeContext example
						hasSubject: (self class gtExamplesFactoryClass subjectFrom: each)) ].

	^ 0
]
