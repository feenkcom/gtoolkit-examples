asserting
assertDebuggingExample: anExample raises: anException
	| result possibleResult |

	self assert: anExample isValid.
	possibleResult := Object new.
	result := possibleResult.
	self 
		should: [ result := anExample debug ] 
		raise: anException.
	self assert: result == possibleResult.