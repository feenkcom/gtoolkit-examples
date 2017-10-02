private
resolveByName
	^ self aspectClass new
		theClass: nil;
		theClassName: self theClassName;
		meta: self meta;
		yourself