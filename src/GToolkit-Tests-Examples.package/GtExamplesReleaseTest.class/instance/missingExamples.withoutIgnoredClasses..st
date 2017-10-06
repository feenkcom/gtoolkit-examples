private
missingExamples: missingExamples withoutIgnoredClasses: classes
	| missingExamplesWithoutIgnoredClasses |
	classes isEmptyOrNil ifTrue: [ ^ missingExamples ].
	missingExamplesWithoutIgnoredClasses := missingExamples copy.
	classes do: [ :class | missingExamplesWithoutIgnoredClasses removeKey: class ifAbsent: [  ] ].
	^ missingExamplesWithoutIgnoredClasses