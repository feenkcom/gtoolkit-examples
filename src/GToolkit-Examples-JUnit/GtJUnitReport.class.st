Class {
	#name : #GtJUnitReport,
	#superclass : #GtJUnitXmlElement,
	#instVars : [
		'suites'
	],
	#category : #'GToolkit-Examples-JUnit-Model'
}

{ #category : #'instance creation' }
GtJUnitReport class >> fromFile: aFileReference [
	^ aFileReference asFileReference
		readStreamDo: [ :stream | self fromXml: (XMLDOMParser parse: stream) root ]
]

{ #category : #'instance creation' }
GtJUnitReport class >> fromString: aString [
	^ self fromXml: (XMLDOMParser parse: aString) root
]

{ #category : #accessing }
GtJUnitReport >> allTestCases [
	^ suites flatCollect: #allTestCases
]

{ #category : #accessing }
GtJUnitReport >> errorCount [
	^ self allTestCases count: #isError
]

{ #category : #accessing }
GtJUnitReport >> failureCount [
	^ self allTestCases count: #isFailure
]

{ #category : #'gt - views' }
GtJUnitReport >> gtTestCasesFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Test cases';
		priority: 10;
		question: 'Which tests ran and what were their outcomes?';
		items: [ self allTestCases ];
		column: 'Class' text: #className;
		column: 'Name' text: #name;
		column: 'Status' text: #status
]

{ #category : #'gt - views' }
GtJUnitReport >> gtUnsuccessfulFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Failures and errors';
		priority: 5;
		question: 'Which tests need attention?';
		items: [ self unsuccessfulTestCases ];
		column: 'Class' text: #className;
		column: 'Name' text: #name;
		column: 'Status' text: #status
]

{ #category : #initialization }
GtJUnitReport >> initializeFromXml: anElement [
	super initializeFromXml: anElement.
	(xml isNamed: 'testsuite')
		ifTrue: [ suites := {GtJUnitTestSuite fromXml: xml}.
			^ self ].
	(xml isNamed: 'testsuites')
		ifFalse: [ self error: 'Expected testsuite or testsuites root' ].
	suites := (xml elements select: [ :each | each isNamed: 'testsuite' ])
			collect: [ :each | GtJUnitTestSuite fromXml: each ]
]

{ #category : #accessing }
GtJUnitReport >> passingCount [
	^ self allTestCases count: #isPassed
]

{ #category : #accessing }
GtJUnitReport >> skippedCount [
	^ self allTestCases count: #isSkipped
]

{ #category : #accessing }
GtJUnitReport >> suites [
	^ suites
]

{ #category : #accessing }
GtJUnitReport >> totalCount [
	^ self allTestCases size
]

{ #category : #accessing }
GtJUnitReport >> unsuccessfulTestCases [
	^ self allTestCases select: [ :each | each isFailure or: [ each isError ] ]
]
