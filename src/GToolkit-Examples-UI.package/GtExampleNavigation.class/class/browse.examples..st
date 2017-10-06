private
browse: aString examples: aCollection
	| env |
	env := RBSelectorEnvironment new.
	aCollection do: [ :example |
		env addClass: example methodClass selector: example selector ].
	env isEmpty 
		ifTrue: [ ^ UIManager default inform: 'No examples found' ].
	^ env gtBrowseFor: aString