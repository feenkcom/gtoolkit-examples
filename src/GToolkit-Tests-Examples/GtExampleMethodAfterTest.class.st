Class {
	#name : #GtExampleMethodAfterTest,
	#superclass : #TestCase,
	#category : 'GToolkit-Tests-Examples'
}

{ #category : #utils }
GtExampleMethodAfterTest >> assert: aGTExampleMethod class: aClass className: aName meta: meta selector: aSelector [ 

	self assert: aGTExampleMethod methodClass == aClass.
	self assert: aGTExampleMethod methodClassName = aName.
	self assert: aGTExampleMethod meta = meta.
	self assert: aGTExampleMethod selector = aSelector.
	
	self assert: aGTExampleMethod exists.
	self assert: aGTExampleMethod isValid.
	
	"self shouldnt: [ aGTExampleMethod resetStub ] raise: Exception."
	"self assert: (aGTExampleMethod instVarNamed: 'methodClass') isNil."
	
	self assert: aGTExampleMethod methodClass == aClass.
	self assert: aGTExampleMethod methodClassName = aName.
	self assert: aGTExampleMethod meta = meta.
	self assert: aGTExampleMethod selector = aSelector.
	
	self assert: aGTExampleMethod exists.
	self assert: aGTExampleMethod isValid.
]

{ #category : #tests }
GtExampleMethodAfterTest >> testFromClassNamedSelector [
	| exampleMethod |
	exampleMethod := GtExampleMethodAfter fromClassNamed: #GtExampleMethodAfter selector: #gtSpotterGTExamplesFor:.
	self assert: exampleMethod class: GtExampleMethodAfter className: #GtExampleMethodAfter meta: false selector: #gtSpotterGTExamplesFor:.
	
	exampleMethod := GtExampleMethodAfter fromClassNamed: 'GtExampleMethodAfter' selector: #gtSpotterGTExamplesFor:.
	self assert: exampleMethod class: GtExampleMethodAfter className: #GtExampleMethodAfter meta: false selector: #gtSpotterGTExamplesFor:.
	
	exampleMethod := GtExampleMethodAfter fromClassNamed: #GtExampleMethodAfter selector: #gtSpotterGTExamplesFor:.
	self assert: exampleMethod class: GtExampleMethodAfter className: 'GtExampleMethodAfter' meta: false selector: #gtSpotterGTExamplesFor:.
]

{ #category : #tests }
GtExampleMethodAfterTest >> testFromClassSelector [
	| exampleMethod |
	exampleMethod := GtExampleMethodAfter fromClass: GtExampleMethodAfter selector: #gtSpotterGTExamplesFor:.
	self assert: exampleMethod class: GtExampleMethodAfter className: #GtExampleMethodAfter meta: false selector: #gtSpotterGTExamplesFor:.
	self assert: exampleMethod class: GtExampleMethodAfter className: 'GtExampleMethodAfter' meta: false selector: #gtSpotterGTExamplesFor:.
]
