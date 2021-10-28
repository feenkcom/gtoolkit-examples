Extension { #name : #TraitDescription }

{ #category : #'*GToolkit-Examples-Core' }
TraitDescription >> asGTExampleSubject [
	^ self class gtExamplesFactoryClass classSubjectFrom: self
]

{ #category : #'*GToolkit-Examples-Core' }
TraitDescription >> gtExamples [
	^ self gtExamplesFactory gtExamplesContained
]

{ #category : #'*GToolkit-Examples-Core' }
TraitDescription >> gtExamplesFactory [
	^ self class gtExamplesFactoryClass new
		sourceClass: self;
		yourself
]

{ #category : #'*GToolkit-Examples-Core' }
TraitDescription >> gtExamplesSubjects [
	"I return the list of subjects for examples that I define on the instance side."
	^ { }
]

{ #category : #'*GToolkit-Examples-Core' }
TraitDescription >> gtParametrizedExamples [
	^ self gtParametrizedExamplesFactory gtParametrizedExamplesContained
]

{ #category : #'*GToolkit-Examples-Core' }
TraitDescription >> gtParametrizedExamplesFactory [
	^ self class gtParametrizedExamplesFactoryClass new
		sourceClass: self;
		yourself
]
