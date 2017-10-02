private
methodClassResolver
	^ GTExampleMethodResolver new 
		methodClassName: self methodClassName;
		meta: self meta;
		selector: self selector;
		yourself