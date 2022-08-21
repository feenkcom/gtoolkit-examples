Extension { #name : #CompiledMethod }

{ #category : #'*GToolkit-Examples-Core' }
CompiledMethod >> gtExample [
	self gtExamplesFactory exampleMethod: self do: [ :example | ^ example ].
	^ nil
]

{ #category : #'*GToolkit-Examples-Core' }
CompiledMethod >> gtExampleValue [
	^ self gtExample returnValue
]

{ #category : #'*GToolkit-Examples-Core' }
CompiledMethod >> gtExampleWithResult [
	| aWeak anExample |
	aWeak := self propertyAt: #gtExampleWithResultWeakReference ifAbsent: [ nil ].
	aWeak
		ifNotNil: [ :theWeak | 
			(theWeak at: 1 ifAbsent: [ nil ])
				ifNotNil: [ :anExampleWithResult | ^ anExampleWithResult ] ].

	anExample := self gtExample.
	anExample
		ifNotNil: [ | anExampleWithResult |
			anExampleWithResult := anExample asExampleWithResult.
			self
				propertyAt: #gtExampleWithResultWeakReference
				put: anExampleWithResult asWeakReference.
			^ anExampleWithResult ].

	^ nil
]

{ #category : #'*GToolkit-Examples-Core' }
CompiledMethod >> gtExamples [
	^ self gtExample 
		ifNotNil: [ :example | { example } ]
		ifNil: [ #( ) ]
]

{ #category : #'*GToolkit-Examples-Core' }
CompiledMethod >> gtExamplesFactory [
	^ self methodClass instanceSide gtExamplesFactory
]

{ #category : #'*GToolkit-Examples-Core' }
CompiledMethod >> gtParametrizedExample [
	self gtParametrizedExamplesFactory exampleMethod: self do: [ :example | ^ example ].
	^ nil
]

{ #category : #'*GToolkit-Examples-Core' }
CompiledMethod >> gtParametrizedExamples [
	^ self gtParametrizedExample 
		ifNotNil: [ :example | { example } ]
		ifNil: [ #( ) ]
]

{ #category : #'*GToolkit-Examples-Core' }
CompiledMethod >> gtParametrizedExamplesFactory [
	^ self methodClass instanceSide gtParametrizedExamplesFactory
]

{ #category : #'*GToolkit-Examples-Core' }
CompiledMethod >> gtValueWithReceiver: aReceiver possibleArguments: anArray [ 
	^ anArray size = self numArgs 
		ifTrue: [ self valueWithReceiver: aReceiver arguments: anArray  ]
		ifFalse: [ self valueWithReceiver: aReceiver arguments: (anArray copyFrom: 1 to: self numArgs) ]
]

{ #category : #'*GToolkit-Examples-Core' }
CompiledMethod >> isGTExampleMethod [

	"Spy2 changes the AST of the method and removes pragmas.
 	Therefore we need to ask an original method instead"
 	((self respondsTo: #isSpy)
 		and: [ self isSpy ])
 			ifTrue: [ ^ self originalMethod isGTExampleMethod ].

 	^ (self pragmas anySatisfy: [ :each | each isGTExamplePragma ])
 		and: [ self numArgs = 0 ]
]

{ #category : #'*GToolkit-Examples-Core' }
CompiledMethod >> isGTParametrizedExampleMethod [

	"Spy2 changes the AST of the method and removes pragmas.
	Therefore we need to ask an original method instead"
	((self respondsTo: #isSpy)
		and: [ self isSpy ])
 			ifTrue: [ ^ self originalMethod isGTParametrizedExampleMethod ].

 	^ (self pragmas anySatisfy: [ :each | each isGTExamplePragma ])
 		and: [ self numArgs > 0 ]
]
