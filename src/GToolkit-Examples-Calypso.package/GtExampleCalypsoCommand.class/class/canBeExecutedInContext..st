testing
canBeExecutedInContext: aToolContext
	^ (super canBeExecutedInContext: aToolContext) and: [ 
		aToolContext selectedItems anySatisfy: [ :each | 
			each hasProperty: GtExampleProperty ] ]