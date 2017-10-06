private
browseExamples: aString select: aBlock
	^ self browse: aString examples: (Smalltalk gtExamplesContained select: [ :example | aBlock value: example ])