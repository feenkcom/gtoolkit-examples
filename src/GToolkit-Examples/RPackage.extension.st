Extension { #name : 'RPackage' }

{ #category : '*GToolkit-Examples-Core' }
RPackage >> gtExamplesAllContained [
	"I obtain all examples contained in this package by collecting all examples 
	contained by the classes in this package."
	| examples |
	examples := ((self definedClasses reject: [ :aClass | 
			aClass isAbstract or: [ aClass isTrait ] ])
		asSortedCollection: [ :a :b | a name <= b name ])
		flatCollect: #gtExamplesAll.
	^ examples asOrderedCollection
]

{ #category : '*GToolkit-Examples-Core' }
RPackage >> gtExamplesContained [
	"I obtained the examples contained only in this package by collecting the examples 
	contained by the classes in this package."
	| examples |
	examples := ((self definedClasses reject: [ :aClass | 
			aClass isAbstract or: [ aClass isTrait ] ])
		asSortedCollection: [ :a :b | a name <= b name ])
		flatCollect: #gtExamples.
	^ examples asOrderedCollection
]

{ #category : '*GToolkit-Examples-Core' }
RPackage >> gtParametrizedExamplesContained [
	"I obtained the examples contained only in this package by collecting the examples 
	contained by the classes in this package."
	| examples |
	examples := ((self definedClasses reject: [ :aClass | 
			aClass isAbstract or: [ aClass isTrait ] ])
		asSortedCollection: [ :a :b | a name <= b name ])
		flatCollect: #gtParametrizedExamples.
	^ examples asOrderedCollection
]
