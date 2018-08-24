Extension { #name : #Collection }

{ #category : #'*GToolkit-Examples-Extensions' }
Collection class >> gtExampleEmptyArray [
	<gtExample>
	^ #()
]

{ #category : #'*GToolkit-Examples-Extensions' }
Collection class >> gtExampleOrderedCollectionWithOneElement [
	<gtExample>
	^ #(42) asOrderedCollection
]
