Extension { #name : #OCIRSequence }

{ #category : #'*GToolkit-Examples-Extensions' }
OCIRSequence >> gtExampleSequence [
	<gtExample>
	^ (self class >> #gtExampleSequence) ast ir startSequence
]
