Extension { #name : #IRInstruction }

{ #category : #'*GToolkit-Examples-Extensions' }
IRInstruction class >> gtExamplePushReciever [
	<gtExample>
	^ (self class >> #gtExamplePushReciever) ast ir startSequence sequence first
]
