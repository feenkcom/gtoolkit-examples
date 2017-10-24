enumerating
groupedBy: aBlock 
	"we are reimplementing this method here and not reuse the one in collection
	because we want the keys to be groups, not simple collections"
	| result |
	result := Dictionary new.
	self do:
		[:each | | key collection |
		key := aBlock value: each.
		collection := result at: key ifAbsentPut: [ OrderedCollection new ].
		collection add: each].
	result keysAndValuesDo:
			[:key :value | result at: key put: (self species withAll: value)].
	^ result