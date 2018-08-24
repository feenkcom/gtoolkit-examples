Extension { #name : #IRSequence }

{ #category : #'*GToolkit-Examples-Extensions' }
IRSequence class >> gtExampleSequence [
	<gtExample>
	^ (self class >> #gtExampleSequence) ast ir startSequence
]
