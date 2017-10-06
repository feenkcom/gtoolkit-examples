running
runExample: anExample
	| errors |
	errors := OrderedCollection new.
	self
		beginExample: anExample
		runBlock: [ | returnValue stack |
			[ returnValue := anExample debug returnValue.
			(self checkAllPresentationsOf: returnValue)
				do: [ :each | 
					stack := each value asString , Character cr asString , Character tab asString , ' in ' , returnValue class name , '>>>' , each key asString.
					errors add: each value -> stack ] ]
				on: Halt , Error , AssertionFailure
				do: [ :err | 
					(anExample exceptions handles: err)
						ifFalse: [ stack := self stackTraceString: err of: anExample.
							errors add: err -> stack ] ] ].
	errors do: [ :each | self writeError: each key andStack: each value for: anExample ].
	
	self endExample