Class {
	#name : #GtExamplesAnnouncingExamples,
	#superclass : #GtExampleProvider,
	#category : #'GToolkit-Tests-Examples'
}

{ #category : #'examples - results' }
GtExamplesAnnouncingExamples >> allAtOnceExampleExecutionFromClassA [
	<gtExample>
	<return: #GtExplicitExampleGroup>
	| anExampleGroup theAnnouncements theExamples |
	theAnnouncements := OrderedCollection new.
	theExamples := self examplesFromClassA.
	anExampleGroup := GtExampleGroup withAll: theExamples.
	self registerExampleAnnouncementsFrom: anExampleGroup to: theAnnouncements.
	anExampleGroup runAll.
	self assert: theAnnouncements size equals: 1.
	self assert: theAnnouncements first class equals: GtExamplesExecuted.
	self assert: theAnnouncements first group equals: anExampleGroup.
	anExampleGroup examples
		do: [ :eachExampleWithResult | self assert: eachExampleWithResult hasResult ].
	^ anExampleGroup
]

{ #category : #asserting }
GtExamplesAnnouncingExamples >> assertExampleFactory: anExampleFactory forClass: aSourceClass [
	self assert: anExampleFactory sourceClass equals: aSourceClass.
	self assert: anExampleFactory exampleClass equals: GtExample.
]

{ #category : #asserting }
GtExamplesAnnouncingExamples >> assertExamples: currentExamples withSelectors: expectedSelectors [
	| obtainedSelectors |
	obtainedSelectors := (currentExamples collect: #selector) asArray sorted: [ :a :b | a < b ].
	self assert: obtainedSelectors size equals: expectedSelectors size.
	self assert: obtainedSelectors equals: expectedSelectors.
]

{ #category : #'examples - factories' }
GtExamplesAnnouncingExamples >> exampleFactoryForClassA [
	<gtExample>
	<return: #GtExampleFactory>
	| anExampleFactory |
	anExampleFactory := GtDummyAnnouncingExamplesA gtExamplesFactory.
	self
		assertExampleFactory: anExampleFactory
		forClass: GtDummyAnnouncingExamplesA.
	^ anExampleFactory
]

{ #category : #'examples - groups' }
GtExamplesAnnouncingExamples >> exampleFromMethodNumberExample [
	<gtExample>
	<return: #GtExample>
	| theExamples |
	theExamples := (GtDummyAnnouncingExamplesA >> #numberExample) gtExamples.
	self assertExamples: theExamples withSelectors: #(#numberExample).
	^ theExamples first
]

{ #category : #'examples - groups' }
GtExamplesAnnouncingExamples >> examplesFromClassA [
	<gtExample>
	<return: #OrderedCollection>
	| anExamples |
	anExamples := self exampleFactoryForClassA gtExamplesContained.
	self assertExamples: anExamples withSelectors: #(#numberExample #stringExample).
	^ anExamples
]

{ #category : #'examples - results' }
GtExamplesAnnouncingExamples >> individualExampleExecutionFromClassA [
	<gtExample>
	<return: #GtExplicitExampleGroup>
	| anExampleGroup theAnnouncements theExamples |
	theAnnouncements := OrderedCollection new.
	theExamples := self examplesFromClassA.
	anExampleGroup := GtExampleGroup withAll: theExamples.
	self registerExampleAnnouncementsFrom: anExampleGroup to: theAnnouncements.
	anExampleGroup examples do: #run.
	self assert: theAnnouncements size equals: theExamples size.
	anExampleGroup examples
		do: [ :eachExampleWithResult | self assert: eachExampleWithResult hasResult ].
	^ anExampleGroup
]

{ #category : #convenience }
GtExamplesAnnouncingExamples >> registerExampleAnnouncementsFrom: anExample to: theAnnouncements [
	anExample announcer
		when: Announcement
		do: [ :anAnnouncement | theAnnouncements addLast: anAnnouncement ]
		for: self
]

{ #category : #'examples - results' }
GtExamplesAnnouncingExamples >> resultFromMethodNumberExample [
	<gtExample>
	<return: #GtExampleResult>
	| anExampleWithResult aGtExampleResult theAnnouncements |
	theAnnouncements := OrderedCollection new.
	anExampleWithResult := self exampleFromMethodNumberExample asExampleWithResult.
	self registerExampleAnnouncementsFrom: anExampleWithResult to: theAnnouncements.
	aGtExampleResult := anExampleWithResult run.
	self assert: anExampleWithResult result == aGtExampleResult.
	self assert: aGtExampleResult returnValue equals: 42.
	self assert: aGtExampleResult hasException not.
	self assert: theAnnouncements size equals: 1.
	self assert: theAnnouncements first class equals: GtExampleExecuted.
	self assert: theAnnouncements first example == anExampleWithResult.
	self assert: theAnnouncements first result == aGtExampleResult.
	^ aGtExampleResult
]
