execution
executeOnExampleGroup: aGtExampleGroup 
	Sensor shiftPressed 
		ifTrue: [ self inspectExamplesOnExampleGroup: aGtExampleGroup ] 
		ifFalse: [ self inspectReturnValuesOnExampleGroup: aGtExampleGroup ]