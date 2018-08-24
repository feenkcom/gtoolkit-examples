Extension { #name : #KMDispatcher }

{ #category : #'*GToolkit-Examples-Extensions' }
KMDispatcher class >> gtExampleDispatcherWithTarget [
	<gtExample>
	<label: 'Dispatcher with target'>
	
	^ self target: Morph new
]

{ #category : #'*GToolkit-Examples-Extensions' }
KMDispatcher class >> gtExampleDispatcherWithTargetAndShortcuts [
	<gtExample>
	<label: 'Dispatcher with target and shortcuts'>
	
	^ BorderedMorph new kmDispatcher
]

{ #category : #'*GToolkit-Examples-Extensions' }
KMDispatcher class >> gtExampleEmptyDispatcher [
	<gtExample>
	<label: 'Empty dispatcher'>
	
	^ self new
]
