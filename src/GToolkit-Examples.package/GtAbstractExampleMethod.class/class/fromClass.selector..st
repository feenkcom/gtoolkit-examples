instance creation
fromClass: aClass selector: aSelector
	^ self new 
		methodClass: aClass;
		methodClassName: aClass name;
		meta: aClass isMeta;
		selector: aSelector;
		yourself