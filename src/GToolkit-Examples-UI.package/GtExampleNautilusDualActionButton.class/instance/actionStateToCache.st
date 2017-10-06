order
actionStateToCache
	"Return the state of the icon for caching purpose"
	^ result 
		ifNil: [ super actionStateToCache ]
		ifNotNil: [ self exampleStateToCache ]