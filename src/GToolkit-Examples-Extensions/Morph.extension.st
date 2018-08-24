Extension { #name : #Morph }

{ #category : #'*GToolkit-Examples-Extensions' }
Morph class >> gtExampleEmpty [
	<gtExample>
	<label: 'Empty'>
	
	^ self new
]

{ #category : #'*GToolkit-Examples-Extensions' }
Morph class >> gtExampleSubmorphs [
	<gtExample>
	<label: 'Submorphs'>
	
	^ self new
		addMorph: self new;
		addMorph: self new;
		yourself
]
