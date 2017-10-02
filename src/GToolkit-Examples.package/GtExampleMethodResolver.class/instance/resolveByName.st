private
resolveByName
	^ self aspectClass new
		methodClass: nil;
		methodClassName: self methodClassName asSymbol;
		meta: self meta;
		selector: self selector asSymbol;
		yourself