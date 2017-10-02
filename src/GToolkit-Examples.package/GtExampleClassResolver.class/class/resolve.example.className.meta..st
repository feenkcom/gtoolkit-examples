actions
resolve: anAspectClass example: anExample className: aClassOrString meta: meta
	^ (self new 
		aspectClass: anAspectClass;
		example: anExample;
		theClassName: aClassOrString;
		meta: meta;
		yourself) resolve