private
methodUpdated: aCompiledMethod with: aResult
	self currentAction ifNil: [ ^ self ].
	
	[ self currentAction methodUpdated: aCompiledMethod with: aResult ]
		on: Error
		do: [ " ignore " ].
	
	[ NautilusUI allSubInstances do: #updateCategoryAndMethodList ]
		on: Error 
		do: [ " ignore " ]