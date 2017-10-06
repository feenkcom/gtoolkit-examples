private-utils
process: aGTExample do: aBlock onRecursionDo: aBlock2
	(processing includes: aGTExample) ifTrue: [ ^ aBlock2 value ].
	processing add: aGTExample.
	[ aBlock value ] ensure: [ 
		processing remove: aGTExample ]