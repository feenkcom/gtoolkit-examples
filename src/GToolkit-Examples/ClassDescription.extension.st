Extension { #name : #ClassDescription }

{ #category : #'*GToolkit-Examples-Core' }
ClassDescription >> asGTExampleSubject [
	^ self gtExamplesFactoryClass classSubjectFrom: self
]

{ #category : #'*GToolkit-Examples-Core' }
ClassDescription >> gtExamples [
	^ self gtExamplesFactory gtExamplesContained
]

{ #category : #'*GToolkit-Examples-Core' }
ClassDescription >> gtExamplesAll [
	^ self gtExamplesFactory gtExamplesAllContained
]

{ #category : #'*GToolkit-Examples-Core' }
ClassDescription >> gtExamplesFactory [
	^ self gtExamplesFactoryClass new
		sourceClass: self;
		yourself
]

{ #category : #'*GToolkit-Examples-Core' }
ClassDescription >> gtExamplesFactoryClass [
	^ GtExampleFactory
]

{ #category : #'*GToolkit-Examples-Core' }
ClassDescription >> gtExamplesSubjects [
	"I return the list of subjects for examples that I define on the instance side."
	^ { }
]

{ #category : #'*GToolkit-Examples-Core' }
ClassDescription >> gtParametrizedExamples [
	^ self gtParametrizedExamplesFactory gtParametrizedExamplesContained
]

{ #category : #'*GToolkit-Examples-Core' }
ClassDescription >> gtParametrizedExamplesFactory [
	^ self gtParametrizedExamplesFactoryClass new
		sourceClass: self;
		yourself
]

{ #category : #'*GToolkit-Examples-Core' }
ClassDescription >> gtParametrizedExamplesFactoryClass [
	^ GtParametrizedExampleFactory
]
