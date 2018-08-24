Extension { #name : #KMCategory }

{ #category : #'*GToolkit-Examples-Extensions' }
KMCategory class >> gtExampleCategoryWithEntry [
	<gtExample>
	^ (self named: '1 Entry') 
		addKeymapEntry: (KMKeymap 
								named: #FooBar 
								shortcut: $a asKeyCombination
								action: [ ]);
		yourself
]

{ #category : #'*GToolkit-Examples-Extensions' }
KMCategory class >> gtExampleEmptyCategory [
	<gtExample>
	^ self named: 'Empty Example'
]
