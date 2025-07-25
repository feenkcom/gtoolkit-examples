Extension { #name : #PackageTag }

{ #category : #'*GToolkit-Examples' }
PackageTag >> gtExamplesAllContained [
	"I obtain all examples contained in this package tag by collecting all examples 
	contained by the classes in this package tag."
	| examples |
	examples := (self classes reject: [ :aClass | 
			aClass isAbstract or: [ aClass isTrait ] ])
		flatCollect: #gtExamplesAll.
	^ examples asOrderedCollection
]

{ #category : #'*GToolkit-Examples' }
PackageTag >> gtExamplesContained [
	"I obtained the examples contained only in this package tag by collecting the examples 
	contained by the classes in this package tag."
	| examples |
	examples := (self classes reject: [ :aClass | 
			aClass isAbstract or: [ aClass isTrait ] ])
		flatCollect: #gtExamples.
	^ examples asOrderedCollection
]

{ #category : #'*GToolkit-Examples' }
PackageTag >> gtParametrizedExamplesContained [
	"I obtained the examples contained only in this package tag by collecting the examples 
	contained by the classes in this package tag."
	| examples |
	examples := (self classes reject: [ :aClass | 
			aClass isAbstract or: [ aClass isTrait ] ])
		flatCollect: #gtParametrizedExamples.
	^ examples asOrderedCollection
]
