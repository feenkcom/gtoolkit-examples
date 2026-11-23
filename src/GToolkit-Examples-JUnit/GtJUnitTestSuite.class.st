Class {
	#name : #GtJUnitTestSuite,
	#superclass : #GtJUnitXmlElement,
	#instVars : [
		'suites',
		'testCases'
	],
	#category : #'GToolkit-Examples-JUnit-Model'
}

{ #category : #accessing }
GtJUnitTestSuite >> allTestCases [
	^ testCases , (suites flatCollect: #allTestCases)
]

{ #category : #accessing }
GtJUnitTestSuite >> declaredTestCount [
	^ (xml attributeAt: 'tests' ifAbsent: [ ^ nil ]) asInteger
]

{ #category : #'gt - views' }
GtJUnitTestSuite >> gtTestCasesFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Test cases';
		priority: 10;
		question: 'Which test cases belong to this suite and its nested suites?';
		items: [ self allTestCases ];
		column: 'Class' text: #className;
		column: 'Name' text: #name;
		column: 'Status' text: #status
]

{ #category : #initialization }
GtJUnitTestSuite >> initializeFromXml: anElement [
	super initializeFromXml: anElement.
	suites := (xml elements select: [ :each | each isNamed: 'testsuite' ])
			collect: [ :each | GtJUnitTestSuite fromXml: each ].
	testCases := (xml elements select: [ :each | each isNamed: 'testcase' ])
			collect: [ :each | GtJUnitTestCase fromXml: each ]
]

{ #category : #accessing }
GtJUnitTestSuite >> properties [
	| result |
	result := OrderedDictionary new.
	xml elements
		do: [ :element | 
			(element isNamed: 'properties')
				ifTrue: [ element elements
						do: [ :property | 
							(property isNamed: 'property')
								ifTrue: [ result
										at: (property attributeAt: 'name')
										put: (property attributeAt: 'value' ifAbsent: [ property contentString ]) ] ] ] ].
	^ result
]

{ #category : #accessing }
GtJUnitTestSuite >> suites [
	^ suites
]

{ #category : #accessing }
GtJUnitTestSuite >> testCases [
	^ testCases
]
