private
stackTraceString: err of: anExample
	^ String streamContents: [ :str | 
		| context |
		context := err signalerContext.
		[ context isNil 
			or: [  
				(context methodSelector == #'primitiveProcessExample:withArguments:' and: [ 
					context arguments first = anExample ])
					or: [ context receiver = anExample and: [ context methodSelector = #debug ] ] ] ] whileFalse: [
			str print: context; lf.
			context := context sender ] ] 