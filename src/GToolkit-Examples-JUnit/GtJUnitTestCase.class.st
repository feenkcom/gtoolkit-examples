Class {
	#name : #GtJUnitTestCase,
	#superclass : #GtJUnitXmlElement,
	#instVars : [
		'problems'
	],
	#category : #'GToolkit-Examples-JUnit-Model'
}

{ #category : #accessing }
GtJUnitTestCase >> className [
	^ xml attributeAt: 'classname'
]

{ #category : #accessing }
GtJUnitTestCase >> firstProblem [
	^ self problems
		ifNotNil: [ :aCollection | aCollection ifNotEmpty: [ aCollection first ] ifEmpty: [ nil ] ]
]

{ #category : #views }
GtJUnitTestCase >> gtFirstProblemDetailsViewFor: aView [
	<gtView>
	^ aView forward
		title: 'Details';
		priority: 45;
		object: [ self firstProblem ];
		view: #gtDetailsFor:
]

{ #category : #views }
GtJUnitTestCase >> gtFirstProblemFramesViewFor: aView [
	<gtView>
	^ aView forward
		title: 'Frames';
		priority: 15;
		object: [ self firstProblem ];
		view: #gtDetailsStackFirstEntryFramesFor:
]

{ #category : #views }
GtJUnitTestCase >> gtFirstProblemMessageViewFor: aView [
	<gtView>
	^ aView forward
		title: 'Message';
		priority: 40;
		object: [ self firstProblem ];
		view: #gtMessageFor:
]

{ #category : #'gt - views' }
GtJUnitTestCase >> gtProblemsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Diagnostics';
		priority: 30;
		question: 'Why did this test fail, error or get skipped?';
		items: [ self problems ];
		column: 'Kind' text: #kind;
		column: 'Type' text: #type;
		column: 'Message' text: #message
]

{ #category : #initialization }
GtJUnitTestCase >> initializeFromXml: anElement [
	super initializeFromXml: anElement.
	problems := (xml elements
			select: [ :each | each isNamedAny: #('failure' 'error' 'skipped') ])
			collect: [ :each | GtJUnitProblem fromXml: each ]
			as: Array
]

{ #category : #testing }
GtJUnitTestCase >> isError [
	^ self status = #error
]

{ #category : #testing }
GtJUnitTestCase >> isFailure [
	^ self status = #failure
]

{ #category : #testing }
GtJUnitTestCase >> isPassed [
	^ self status = #passed
]

{ #category : #testing }
GtJUnitTestCase >> isSkipped [
	^ self status = #skipped
]

{ #category : #'gt - views' }
GtJUnitTestCase >> pharoMethod [
	<return: #CompiledMethod or: nil>
	^ self class environment
		at: self className asSymbol
		ifPresent: [ :aClass | aClass lookupSelector: self name asSymbol ]
		ifAbsent: [ nil ]
]

{ #category : #accessing }
GtJUnitTestCase >> problems [
	^ problems
]

{ #category : #accessing }
GtJUnitTestCase >> status [
	(problems anySatisfy: [ :each | each kind = #error ]) ifTrue: [ ^ #error ].
	(problems anySatisfy: [ :each | each kind = #failure ]) ifTrue: [ ^ #failure ].
	(problems anySatisfy: [ :each | each kind = #skipped ]) ifTrue: [ ^ #skipped ].
	^ #passed
]
