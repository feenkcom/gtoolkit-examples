private
methodClassDo: aBlock
	^ self methodClassDo: aBlock ifNone: [ 
		(GTExampleDeclaredClassMissing new
			example: self example;
			classNamed: self methodClassName;
			meta: self meta;
			yourself) signal ]