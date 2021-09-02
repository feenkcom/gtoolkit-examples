Extension { #name : 'SmalltalkImage' }

{ #category : '*GToolkit-Examples-Core' }
SmalltalkImage >> gtExamplesAllContained [
	| examples |
	examples := OrderedCollection new.
	self allClassesDo: [ :class |
		class isAbstract ifFalse: [ 
			class gtExamplesFactory allExamplesDo: [ :example | 
				examples add: example ] ] ].
	^ examples
]

{ #category : '*GToolkit-Examples-Core' }
SmalltalkImage >> gtExamplesContained [
	| examples |
	examples := OrderedCollection new.
	self allClassesDo: [ :class |
		class isAbstract ifFalse: [ 
			class gtExamplesFactory examplesDo: [ :example | 
				examples add: example ] ] ].
	^ examples
]

{ #category : '*GToolkit-Examples-Core' }
SmalltalkImage >> gtParametrizedExamplesContained [
	| examples |
	examples := OrderedCollection new.
	self allClassesDo: [ :class |
		class isAbstract ifFalse: [ 
			class gtParametrizedExamplesFactory examplesDo: [ :example | 
				examples add: example ] ] ].
	^ examples
]
