instance creation
fromClass: aClass
	^ self new 
		theClass: aClass;
		theClassName: aClass name;
		meta: aClass isMeta;
		yourself