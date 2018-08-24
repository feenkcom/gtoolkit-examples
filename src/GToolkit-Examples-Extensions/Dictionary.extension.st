Extension { #name : #Dictionary }

{ #category : #'*GToolkit-Examples-Extensions' }
Dictionary class >> gtExampleEmptyDictionary [
	<gtExample>
	<label: 'Empty dictionary'>

	^ Dictionary new
]

{ #category : #'*GToolkit-Examples-Extensions' }
Dictionary class >> gtExampleOneElementDictionary [
	<gtExample>
	<label: 'One element dictionary'>
	
	^ self gtExampleEmptyDictionary 
		at: 4 put: 2;
		yourself
]

{ #category : #'*GToolkit-Examples-Extensions' }
Dictionary class >> gtExampleRemoveElement [
	<gtExample>
	<label: 'Remove element'>
	
	^ self gtExampleOneElementDictionary 
		removeKey: 4;
		yourself
]

{ #category : #'*GToolkit-Examples-Extensions' }
Dictionary class >> gtExampleTwoElementsDictionary [
	<gtExample>
	<label: 'Two elements dictionary'>
	
	^ self gtExampleOneElementDictionary 
		at: #fourty put: 'two';
		yourself
]
