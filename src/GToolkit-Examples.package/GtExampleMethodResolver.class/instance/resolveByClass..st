private
resolveByClass: aClass
	^ self aspectClass new
		methodClass: aClass;
		methodClassName: aClass name;
		meta: aClass isMeta;
		selector: self selector asSymbol;
		yourself