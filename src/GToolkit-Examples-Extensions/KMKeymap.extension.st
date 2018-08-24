Extension { #name : #KMKeymap }

{ #category : #'*GToolkit-Examples-Extensions' }
KMKeymap class >> gtExampleKeymapA [
	<gtExample>
	<label: 'Keymap: a'>
	
	^ self 
		named: #a 
		shortcut: $a asKeyCombination
		action: [ ]
]

{ #category : #'*GToolkit-Examples-Extensions' }
KMKeymap class >> gtExampleKeymapFOO [
	<gtExample>
	<label: 'Keymap: FOO'>
	
	^ self 
		named: #Foo
		shortcut: $F asKeyCombination, $O asKeyCombination, $O asKeyCombination
		action: [ ]
]
