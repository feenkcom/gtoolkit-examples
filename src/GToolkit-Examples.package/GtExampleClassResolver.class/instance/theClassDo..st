private
theClassDo: aBlock
	^ self theClassDo: aBlock ifNone: [ 
		(GTExampleDeclaredClassMissing new
			example: self example;
			classNamed: self theClassName;
			meta: self meta;
			yourself) signal ]