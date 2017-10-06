order
isActionHandled
	^ self class isAbstract not 
		and: [ self class isEnabled
			and: [ method isGTExampleMethod ] ]