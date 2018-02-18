execution
executeOnExampleGroup: aGtExampleGroup 
	Sensor shiftPressed 
		ifFalse: [ self inspectExamplesOnExampleGroup: aGtExampleGroup ] 
		ifTrue: [ self inspectReturnValuesOnExampleGroup: aGtExampleGroup ]