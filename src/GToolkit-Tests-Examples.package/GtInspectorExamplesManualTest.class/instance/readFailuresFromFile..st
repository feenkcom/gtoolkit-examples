private
readFailuresFromFile: aFile
	aFile exists ifFalse: [ ^ OrderedCollection new ].
	^ (((aFile readStream contents splitOn: String cr)
		collect: [ :each | [ Smalltalk compiler evaluate: each trimBoth ] on: Error do: [ nil ] ])
		reject: [ :each | each isNil ]) asSet asOrderedCollection