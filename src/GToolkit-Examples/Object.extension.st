Extension { #name : #Object }

{ #category : #'*GToolkit-Examples-Core' }
Object >> asGTExampleSubject [
	^ self class gtExamplesFactoryClass instanceSubjectFromObject: self
]

{ #category : #'*GToolkit-Examples-Core' }
Object >> assert: actual equals: expected [
	self
		assert: actual = expected
		description: [ String streamContents: [:stream |
			stream
				nextPutAll: 'Assertion failed. Got ';
				nextPutAll: actual fullPrintString;
				nextPutAll: ' instead of ';
				nextPutAll: expected fullPrintString;
				nextPutAll: '.'] ]
]

{ #category : #'*GToolkit-Examples-Core' }
Object class >> gtExampleRuntimeContext [
	^ self gtExamplesFactoryClass gtExampleRuntimeContext
]

{ #category : #'*GToolkit-Examples-Core' }
Object >> gtExampleRuntimeContext [
	<return: #GtExampleRuntimeContext>
	^ self class gtExampleRuntimeContext
]

{ #category : #'*GToolkit-Examples-Core' }
Object >> gtExamples [
	^ self class gtExamples
]

{ #category : #'*GToolkit-Examples-Core' }
Object >> gtExamplesAll [
	^ self class gtExamplesAll
]

{ #category : #'*GToolkit-Examples-Core' }
Object >> gtExamplesAllContained [
	^ self gtExamplesAll
]

{ #category : #'*GToolkit-Examples-Core' }
Object >> gtExamplesContained [
	^ self gtExamples
]

{ #category : #'*GToolkit-Examples-Core' }
Object >> gtExamplesFactory [
	^ self class gtExamplesFactory
]

{ #category : #'*GToolkit-Examples-Core' }
Object >> gtExampleSubstrings [
	^ {  }
]

{ #category : #'*GToolkit-Examples-Core' }
Object >> gtParametrizedExamples [
	^ self class gtParametrizedExamples
]

{ #category : #'*GToolkit-Examples-Core' }
Object >> gtParametrizedExamplesContained [
	^ self gtParametrizedExamples
]

{ #category : #'*GToolkit-Examples-Core' }
Object >> gtParametrizedExamplesFactory [
	^ self class gtParametrizedExamplesFactory
]

{ #category : #'*GToolkit-Examples-Core' }
Object >> isGTExample [
	^ false
]

{ #category : #'*GToolkit-Examples-Exceptions' }
Object >> isGTExampleError [
	^ false
]

{ #category : #'*GToolkit-Examples-Core' }
Object >> isGTExampleMethod [
	^ false
]

{ #category : #'*GToolkit-Examples-Core' }
Object >> isGTParametrizedExampleMethod [
	^ false
]
