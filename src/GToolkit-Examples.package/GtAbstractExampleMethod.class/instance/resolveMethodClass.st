private
resolveMethodClass
	" an aspect might reference a class not being present in the system - it has to be resolved again in this case "
	^ self methodClassResolver methodClassDo: [ :class | class ] ifNone: [ nil ]