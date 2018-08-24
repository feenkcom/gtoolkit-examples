Extension { #name : #SharedQueue }

{ #category : #'*GToolkit-Examples-Extensions' }
SharedQueue class >> gtExampleBasic [
	<gtExample>
	^ self new
		nextPut: 4;
		nextPut: 2;
		yourself
]
