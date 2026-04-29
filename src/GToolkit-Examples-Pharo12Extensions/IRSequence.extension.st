Extension { #name : #IRSequence }

{ #category : #'*GToolkit-Examples-Pharo12Extensions' }
IRSequence class >> gtExampleSequence [
	<gtExample>
	^ (self class >> #gtExampleSequence) ast ir startSequence
]
