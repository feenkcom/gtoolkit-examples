Extension { #name : #IRSequence }

{ #category : #'*GToolkit-Examples-Extensions' }
IRSequence classSide >> gtExampleSequence [
	<gtExample>
	^ (self class >> #gtExampleSequence) ast ir startSequence
]
