execution
prepareFullExecutionInContext: aToolContext
	super prepareFullExecutionInContext: aToolContext.
	Sensor shiftPressed ifTrue: [ 
		selectedItems := aToolContext selectedClassItems ].