Extension { #name : #ReadStream }

{ #category : #'*GToolkit-Examples-Extensions' }
ReadStream class >> gtExampleReadStream [
	<gtExample>
	<label: 'Stream'>
	
	^ 'GTInspector' readStream
]

{ #category : #'*GToolkit-Examples-Extensions' }
ReadStream class >> gtExampleReadStreamAtEnd [
	<gtExample>
	<label: 'Stream at end'>
	
	^ 'GTInspector' readStream 
		upToEnd;
		yourself
]

{ #category : #'*GToolkit-Examples-Extensions' }
ReadStream class >> gtExampleReadStreamEmpty [
	<gtExample>
	<label: 'Empty stream'>
	
	^ '' readStream
]

{ #category : #'*GToolkit-Examples-Extensions' }
ReadStream class >> gtExampleReadStreamWithPosition [
	<gtExample>
	<label: 'Stream with position'>
	
	^ 'GTInspector' readStream 
		next; 
		next; 
		yourself
]
