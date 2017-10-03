private
methodClassResolver
	^ GtExampleMethodResolver new 
		methodClassName: self methodClassName;
		meta: self meta;
		selector: self selector;
		yourself