Class {
	#name : #GtDummyExamplesOnBothSides,
	#superclass : #GtAbstractDummyExamples,
	#category : 'GToolkit-Examples-Dummies-Data'
}

{ #category : #examples }
GtDummyExamplesOnBothSides class >> classSideA [
	<gtExample>
	^ 2
]

{ #category : #examples }
GtDummyExamplesOnBothSides class >> classSideB [
	<gtExample>
	"<dependsOn: #classSideA>"
	| a |
	a := self classSideA.
	self assert: a = 2.
	^ a + 2
]

{ #category : #examples }
GtDummyExamplesOnBothSides class >> classSideC [
	<gtExample>
"	<dependsOn: #classSideA>
	<dependsOnClass: #'GTDummyExamplesOnBothSides class' selector: #classSideB:>
"	| a b |
	a := self classSideA.
	b := self classSideB.
	self assert: a = 2.
	self assert: b = 4.
	^ a + b - 3
]

{ #category : #examples }
GtDummyExamplesOnBothSides class >> classSideD [
	<gtExample>
	"<dependsOnClass: #GTDummyExamplesOnBothSides selector: #c:c:>"
	| instanceSideC |
	instanceSideC := self new c.
	self assert: instanceSideC = 9.
	^ instanceSideC
]

{ #category : #examples }
GtDummyExamplesOnBothSides >> a [
	<gtExample>
	^ 1
]

{ #category : #examples }
GtDummyExamplesOnBothSides >> b [
	<gtExample>
	| a |
	a := self a.
	self assert: a = 1.
	^ a + 1
]

{ #category : #examples }
GtDummyExamplesOnBothSides >> c [
	<gtExample>
	| a b |
	a := self a.
	b := self b.
	self assert: a = 1.
	self assert: b = 2.
	^ a + b + 6
]

{ #category : #examples }
GtDummyExamplesOnBothSides >> d [
	<gtExample>
	| classSideC |
	classSideC := self class classSideC.
	self assert: classSideC = 3.
	^ classSideC
]
