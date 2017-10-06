private
shouldDefineExamples: class
	^ (class theNonMetaClass = class)
		and: [ class isTrait not 
			and: [ (class theNonMetaClass name includesSubstring: 'abstract' caseSensitive: false) not 
				and: [ (class theNonMetaClass name includesSubstring: 'mock' caseSensitive: false) not ] ] ]