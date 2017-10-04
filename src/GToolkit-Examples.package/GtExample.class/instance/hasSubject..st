testing
hasSubject: aSubject
	^ self subjects anySatisfy: [ :each | 
		each == aSubject 
			or: [ each = aSubject ] ]