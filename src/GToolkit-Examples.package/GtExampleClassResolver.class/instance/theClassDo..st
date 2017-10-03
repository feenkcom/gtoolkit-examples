private
theClassDo: aBlock
	^ self theClassDo: aBlock ifNone: [ 
		(GtExampleDeclaredClassMissing new
			example: self example;
			classNamed: self theClassName;
			meta: self meta;
			yourself) signal ]