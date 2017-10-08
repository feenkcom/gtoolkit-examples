accessing
examples: aCollection
	examples := aCollection collect: [ :each | each asExampleWithResult ]