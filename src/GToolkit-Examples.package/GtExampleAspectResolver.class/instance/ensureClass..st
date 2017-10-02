private
ensureClass: aClass
	(aClass isMeta not and: [ self meta ]) 
		ifTrue: [ ^ aClass class " be nice " ].
	(aClass isMeta and: [ self meta not ]) 
		ifTrue: [ ^ aClass "backward compatibility " ].
	" default case "
	^ aClass