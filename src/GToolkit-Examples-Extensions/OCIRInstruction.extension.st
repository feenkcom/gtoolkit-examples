Extension { #name : #OCIRInstruction }

{ #category : #'*GToolkit-Examples-Extensions' }
OCIRInstruction >> gtExamplePushReciever [
	<gtExample>
	^ (self class >> #gtExamplePushReciever) ast ir startSequence sequence first
]
