private
basicForm
	^ [ GtExampleMethodIcon 
		perform: self converter 
		withArguments: self arguments ] on: Error do: [ nil ]