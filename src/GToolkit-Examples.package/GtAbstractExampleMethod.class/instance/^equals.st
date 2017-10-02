testing
= anExampleMethod
	^ self class = anExampleMethod class 
		and: [ self methodClassName = anExampleMethod methodClassName 
			and: [ self selector = anExampleMethod selector ] ]