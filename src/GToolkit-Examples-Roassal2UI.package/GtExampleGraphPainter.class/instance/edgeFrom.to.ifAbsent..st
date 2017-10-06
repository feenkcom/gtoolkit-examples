private-utils
edgeFrom: fromExample to: toExample ifAbsent: aBlock
	| processedEdges |
	fromExample ifNil: [ ^ self ].
	toExample ifNil: [ ^ self ].
	processedEdges := fromTo at: fromExample ifAbsentPut: [ Set new ].
	(processedEdges includes: toExample) ifTrue: [ ^ self ].
	[ aBlock value ] ensure: [ 
		processedEdges add: toExample ]