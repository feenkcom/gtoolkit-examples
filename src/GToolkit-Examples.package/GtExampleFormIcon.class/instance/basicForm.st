private
basicForm
	^ [ GTExampleMethodIcon 
		perform: self converter 
		withArguments: self arguments ] on: Error do: [ nil ]