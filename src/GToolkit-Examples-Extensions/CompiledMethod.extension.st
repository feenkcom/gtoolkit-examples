Extension { #name : #CompiledMethod }

{ #category : #'*GToolkit-Examples-Extensions' }
CompiledMethod >> addReturnPragmasRefactoring: aNamespace [
	| returnClass |
	returnClass := self gtExampleReturnValueClass.
	returnClass isAnonymous
		ifFalse: [ (RBAddPragmaTransformation
				model: aNamespace
				pragma: '<return: #''' , returnClass name , '''>'
				inMethod: self selector
				inClass: self methodClass name) primitiveExecute ].
	^ aNamespace
]

{ #category : #'*GToolkit-Examples-Extensions' }
CompiledMethod >> checkReturnPragmasRefactoring: aNamespace [
	| returnClass returnPragma returnPragmaClass |
	returnPragma := self returnPragma.
	returnPragmaClass := returnPragma arguments first asClass.
	returnClass := self gtExampleReturnValueClass.
	(returnClass ~= returnPragmaClass and: [ returnClass isAnonymous not ])
		ifTrue: [ (RBRemovePragmaTransformation
				model: aNamespace
				pragma: self returnPragma printString
				inMethod: self selector
				inClass: self methodClass name) primitiveExecute.
			(RBAddPragmaTransformation
				model: aNamespace
				pragma: '<return: #''' , returnClass name , '''>'
				inMethod: self selector
				inClass: self methodClass name) primitiveExecute ].
	^ aNamespace
]

{ #category : #'*GToolkit-Examples-Extensions' }
CompiledMethod >> gtExampleReturnValueClass [
	| returnValue |
	returnValue := self gtExample result returnValue.
	(returnValue isKindOf: Exception)
		ifTrue: [ ReturnPragmasRefactoringError
				signal: 'An  example failed'
				failingExample: self ].
	^ returnValue class
]

{ #category : #'*GToolkit-Examples-Extensions' }
CompiledMethod class >> gtExampleSimple [
	<gtExample>
	^ self class>>#gtExampleSimple
]

{ #category : #'*GToolkit-Examples-Extensions' }
CompiledMethod >> isGtExampleWithReturnPragma [
	^ (self hasPragmaNamed: #gtExample)
		and: [ (self hasPragmaNamed: #noTest) not
				and: [ (self hasPragmaNamed: #return:)
						and: [ self selector isUnary and: [ self isClassSide not ] ] ] ]
]

{ #category : #'*GToolkit-Examples-Extensions' }
CompiledMethod >> isGtExampleWithoutReturnPragma [
	^ (self hasPragmaNamed: #gtExample)
		and: [ (self hasPragmaNamed: #noTest) not
				and: [ (self hasPragmaNamed: #return:) not
						and: [ self selector isUnary and: [ self isClassSide not ] ] ] ]
]

{ #category : #'*GToolkit-Examples-Extensions' }
CompiledMethod >> returnPragma [
	| returnPragmas  |
	returnPragmas := self pragmas select: [ :p | p selector == #return: ].
	self assert: returnPragmas notEmpty description: 'Missing a return: pragma!'.
	returnPragmas size = 1
		ifFalse: [ ReturnPragmasRefactoringError
				signal: 'Example has multiple return: pragmas!'
				failingExample: self ].
	^ returnPragmas first
]

{ #category : #'*GToolkit-Examples-Extensions' }
CompiledMethod >> returnPragmaClass [
	^ self returnPragma arguments first asClass
]
