private
resolveByClass: aClass
	^ self aspectClass new
		theClass: aClass;
		theClassName: aClass name;
		meta: aClass isMeta;
		yourself