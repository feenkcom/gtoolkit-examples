Class {
	#name : #GtExampleMethodAfterTest,
	#superclass : #TestCase,
	#category : #'GToolkit-Tests-Examples'
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
	exampleMethod := GtExampleMethodAfter fromClassNamed: #GtExampleMethodAfterTest selector: #testFromClassSelector.
	self assert: exampleMethod class: GtExampleMethodAfterTest className: #GtExampleMethodAfterTest meta: false selector: #testFromClassSelector.
]

{ #category : #tests }
GtExampleMethodAfterTest >> testFromClassSelector [
	| exampleMethod |
	exampleMethod := GtExampleMethodAfter fromClass: GtExampleMethodAfterTest selector: #testFromClassSelector.
	self assert: exampleMethod class: GtExampleMethodAfterTest className: #GtExampleMethodAfterTest meta: false selector: #testFromClassSelector.
	self assert: exampleMethod class: GtExampleMethodAfterTest className: 'GtExampleMethodAfterTest' meta: false selector: #testFromClassSelector.
]
