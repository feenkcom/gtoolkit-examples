Extension { #name : #CompiledMethod }

{ #category : #'*GToolkit-Examples-Extensions' }
CompiledMethod >> addReturnPragmasRefactoring: aNamespace [
	| returnClass returnValue |
	returnValue := self gtExample result returnValue.
	(returnValue isKindOf: Exception)
		ifTrue: [ ReturnPragmasRefactoringError
				signal: 'An  example failed'
				failingExample: self ].
	returnClass := returnValue class.
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
	| returnClass returnPragmas returnValue |
	returnPragmas := self pragmas select: [ :p | p selector == #return: ].
	returnPragmas size = 1
		ifFalse: [ ReturnPragmasRefactoringError
				signal: 'Example has multiple return: pragmas!'
				failingExample: self ].
	returnValue := self gtExample result returnValue.
	(returnValue isKindOf: Exception)
		ifTrue: [ ReturnPragmasRefactoringError signal: 'Example failed!' failingExample: self ].
	returnClass := returnValue class.
	(returnClass ~= returnPragmas first arguments first asClass
		and: [ returnClass isAnonymous not ])
		ifTrue: [ (RBRemovePragmaTransformation
				model: aNamespace
				pragma: returnPragmas first printString
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
CompiledMethod class >> gtExampleSimple [
	<gtExample>
	^ self class>>#gtExampleSimple
]
