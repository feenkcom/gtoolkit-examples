Extension { #name : #RPackage }

{ #category : #'*GToolkit-Examples-Extensions' }
RPackage >> addReturnPragmasRefactoring [
	| namespace |
	namespace := RBNamespace new.
	self gtExamplesWithoutReturnPragmas
		do: [ :m | 
			| returnClass returnValue |
			returnValue := m gtExample result returnValue.
			(returnValue isKindOf: Exception)
				ifTrue: [ ReturnPragmasRefactoringError signal: 'An  example failed' failingExample: m ].
			returnClass := returnValue class.
			returnClass isAnonymous
				ifFalse: [ (RBAddPragmaTransformation
						model: namespace
						pragma: '<return: #''' , returnClass name , '''>'
						inMethod: m selector
						inClass: m methodClass name) primitiveExecute ] ].
	^ namespace
]

{ #category : #'*GToolkit-Examples-Extensions' }
RPackage >> checkReturnPragmasRefactoring [
	"NB: no changes if `namespace changes changes isEmpty`"

	| namespace |
	namespace := RBNamespace new.
	self gtExamplesWithReturnPragmas
		do: [ :m | 
			| returnClass returnValue returnPragmas |
			returnPragmas := m pragmas select: [ :p | p selector == #return: ].
			returnPragmas size = 1
				ifFalse: [ ReturnPragmasRefactoringError
						signal: 'An example has multiple return: pragmas!'
						failingExample: m ].
			returnValue := m gtExample result returnValue.
			(returnValue isKindOf: Exception)
				ifTrue: [ ReturnPragmasRefactoringError signal: 'An  example failed!' failingExample: m ].
			returnClass := returnValue class.

			(returnClass ~= returnPragmas first arguments first asClass
				and: [ returnClass isAnonymous not ])
				ifTrue: [ (RBRemovePragmaTransformation
						model: namespace
						pragma: returnPragmas first printString
						inMethod: m selector
						inClass: m methodClass name) primitiveExecute.
					(RBAddPragmaTransformation
						model: namespace
						pragma: '<return: #''' , returnClass name , '''>'
						inMethod: m selector
						inClass: m methodClass name) primitiveExecute ] ].
	^ namespace
]

{ #category : #'*GToolkit-Examples-Extensions' }
RPackage class >> gtExampleEmpty [
	<gtExample>
	<label: 'Empty package'>
	
	^ self named: 'Empty'
]

{ #category : #'*GToolkit-Examples-Extensions' }
RPackage >> gtExamplesWithReturnPragmas [
	^ (self gtPackageMatches & #gtExample gtPragmas & #noTest gtPragmas not
		& #return: gtPragmas) contents
		select: [ :m | m selector isUnary and: [ m isClassSide not ] ]
]

{ #category : #'*GToolkit-Examples-Extensions' }
RPackage >> gtExamplesWithReturnPragmasClassified [
	"Return a dictionary of classes to examples returning an instance of that class.
	NB: We use class names rather than classes as keys."

	| returnDict |
	returnDict := Dictionary new.
	self gtExamplesWithReturnPragmas contents
		do: [ :m | 
			| className |
			className := (m pragmaAt: #return:) arguments first.
			(returnDict at: className ifAbsentPut: [ OrderedCollection new ]) add: m ].
	^ returnDict
]

{ #category : #'*GToolkit-Examples-Extensions' }
RPackage >> gtExamplesWithoutReturnPragmas [
	^ (self gtPackageMatches & #gtExample gtPragmas & #noTest gtPragmas not
		& #return: gtPragmas not) contents
		select: [ :m | m selector isUnary and: [ m isClassSide not ] ]
]

{ #category : #'*GToolkit-Examples-Extensions' }
RPackage >> hasGtExamples [
	^ self gtExamplesContained notEmpty
]

{ #category : #'*GToolkit-Examples-Extensions' }
RPackage >> storeOn: aStream [
	aStream
		nextPut: $(;
		nextPutAll: self class name;
		nextPutAll: ' named: #''';
		nextPutAll: self name;
		nextPutAll: '''; yourself)'
]
