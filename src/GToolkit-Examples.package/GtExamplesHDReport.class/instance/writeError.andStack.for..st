private
writeError: anError andStack: aString for: aTestCase
	"XML tag is now open"
	anError ifNotNil: [
		(anError isKindOf: AssertionFailure)
			ifTrue: [ self writeFailure: anError stack: aString ]
			ifFalse: [ self writeError: anError stack: aString ] ]