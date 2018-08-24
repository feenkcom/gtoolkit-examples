Extension { #name : #BlockClosure }

{ #category : #'*GToolkit-Examples-Extensions' }
BlockClosure class >> gtExampleEmpty [
	<gtExample>
	<label: 'Empty'>
	
	^ [  ]
]

{ #category : #'*GToolkit-Examples-Extensions' }
BlockClosure class >> gtExampleOneArgument [
	<gtExample>
	<label: 'With one argument'>
	
	^ [ :x | x ]
]

{ #category : #'*GToolkit-Examples-Extensions' }
BlockClosure class >> gtExampleTwoArguments [
	<gtExample>
	<label: 'With two arguments'>
	
	^ [ :x :y | x + y ]
]
