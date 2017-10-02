actions
resolve: anAspectClass example: anExample className: aClassOrString meta: meta selector: aStringOrSelector
	^ (self new 
		aspectClass: anAspectClass;
		example: anExample;
		methodClassName: aClassOrString;
		meta: meta;
		selector: aStringOrSelector;
		yourself) resolve