testing
canProcess
	"I verify if this processor can execute on the given example. I do this by running the processor
	and checking if any example-specific specific is raised. Such exceptions indicate a problem with
	the given example that does not make it possible to apply the processor. "
	
	[ self value ]
		on: GtExampleError
		do: [ ^ false ].
	^ true