actions
resolve: anAspectClass example: anExample selector: aStringOrSelector
	^ (self new 
		aspectClass: anAspectClass;
		example: anExample;
		methodClassName: anExample methodClass;
		meta: anExample methodClass isMeta;
		selector: aStringOrSelector;
		yourself) resolve