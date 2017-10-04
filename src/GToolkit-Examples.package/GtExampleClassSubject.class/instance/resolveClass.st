private
resolveClass
	" an aspect might reference a class not being present in the system - it has to be resolved again in this case "
	^ self classResolverClass theClassDo: [ :class | class ] ifNone: [ nil ]