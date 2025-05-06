Extension { #name : #RPackage }

{ #category : #'*GToolkit-Examples-Extensions' }
RPackage class >> gtExampleEmpty [
	<gtExample>
	<label: 'Empty package'>
	
	^ self named: 'Empty'
]

{ #category : #'*GToolkit-Examples-Extensions' }
RPackage >> gtExamplesWithReturnPragmas [
	^ (self gtPackageMatches & #gtExample gtPragmas & #noTest gtPragmas not
		& #return: gtPragmas) contents select: [ :m | m selector isUnary ]
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
		& #return: gtPragmas not) contents select: [ :m | m selector isUnary ]
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
