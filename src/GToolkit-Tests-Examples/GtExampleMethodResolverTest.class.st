Class {
	#name : #GtExampleMethodResolverTest,
	#superclass : #TestCase,
	#category : 'GToolkit-Tests-Examples'
}

{ #category : #utils }
GtExampleMethodResolverTest >> assert: aGTExampleMethod class: aClass classNamed: aClassName meta: aBoolean selector: aSelector [

	self assert: aGTExampleMethod methodClass == aClass.
	self assert: aGTExampleMethod methodClassName = aClassName.
	self assert: aGTExampleMethod meta = aBoolean.
	self assert: aGTExampleMethod selector = aSelector.
	self assert: aGTExampleMethod selector isSymbol.
	
	self assert: aGTExampleMethod exists.
	
	"self shouldnt: [ aGTExampleMethod resetStub ] raise: Exception.
	self assert: (aGTExampleMethod instVarNamed: 'methodClass') isNil."
	
	self assert: aGTExampleMethod methodClass == aClass.
	self assert: aGTExampleMethod methodClassName = aClassName.
	self assert: aGTExampleMethod meta = aBoolean.
	self assert: aGTExampleMethod selector = aSelector.
	self assert: aGTExampleMethod selector isSymbol.
	
	self assert: aGTExampleMethod exists.
]

{ #category : #'tests-convenience' }
GtExampleMethodResolverTest >> testResolveByName [
	| method |
	method := GtExampleMethodResolver resolve: GtExampleMethodAfter example: nil className: #GtExampleMethodResolver meta: false selector: #selector.
	
	self assert: method class: GtExampleMethodResolver classNamed: #GtExampleMethodResolver meta: false selector: #selector.
	self assert: method class: GtExampleMethodResolver classNamed: 'GtExampleMethodResolver' meta: false selector: #selector.
	
	method := GtExampleMethodResolver resolve: GtExampleMethodAfter example: nil className: 'GtExampleMethodResolver' meta: false selector: 'selector'.
	
	self assert: method class: GtExampleMethodResolver classNamed: #GtExampleMethodResolver meta: false selector: #selector.
	self assert: method class: GtExampleMethodResolver classNamed: 'GtExampleMethodResolver' meta: false selector: #selector.
]

{ #category : #'tests-convenience' }
GtExampleMethodResolverTest >> testResolveMetaByName [
	| method |
	method := GtExampleMethodResolver resolve: GtExampleMethodAfter example: nil className: #GtExampleMethodResolver meta: true selector: #resolve:example:selector:.
	
	self assert: method class: GtExampleMethodResolver class classNamed: 'GtExampleMethodResolver class' meta: true selector: #resolve:example:selector:.
	self assert: method class: GtExampleMethodResolver class classNamed: 'GtExampleMethodResolver class' meta: true selector: #resolve:example:selector:.
	
	method := GtExampleMethodResolver resolve: GtExampleMethodAfter example: nil className: 'GtExampleMethodResolver' meta: true selector: #resolve:example:selector:.
	
	self assert: method class: GtExampleMethodResolver class classNamed: 'GtExampleMethodResolver class' meta: true selector: #resolve:example:selector:.
	self assert: method class: GtExampleMethodResolver class classNamed: 'GtExampleMethodResolver class' meta: true selector: #resolve:example:selector:.
]

{ #category : #'tests-convenience' }
GtExampleMethodResolverTest >> testResolveMetaByNameWithSystemCompatibility [
	| method |
	method := GtExampleMethodResolver resolve: GtExampleMethodAfter example: nil className: 'GtExampleMethodResolver class' meta: true selector: #resolve:example:selector:.
	
	self assert: method class: GtExampleMethodResolver class classNamed: 'GtExampleMethodResolver class' meta: true selector: #resolve:example:selector:.
	self assert: method class: GtExampleMethodResolver class classNamed: 'GtExampleMethodResolver class' meta: true selector: #resolve:example:selector:.
	
	method := GtExampleMethodResolver resolve: GtExampleMethodAfter example: nil className: 'GtExampleMethodResolver class' meta: false selector: 'resolve:example:selector:'.
	
	self assert: method class: GtExampleMethodResolver class classNamed: 'GtExampleMethodResolver class' meta: true selector: #resolve:example:selector:.
	self assert: method class: GtExampleMethodResolver class classNamed: 'GtExampleMethodResolver class' meta: true selector: #resolve:example:selector:.
]
