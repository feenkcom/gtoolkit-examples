Class {
	#name : #GtDummyExamplesWithAfterInstanceSideSubclass,
	#superclass : #GtDummyExamplesWithAfterInstanceSide,
	#category : #'GToolkit-Examples-Dummies-Data'
}

{ #category : #'keys - letters' }
GtDummyExamplesWithAfterInstanceSideSubclass >> d [
	" START -> D -> afterD (superclass) -> END "

	<gtExample>
	<after: #afterD>
	<return: #GtExampleRuntimeContext>
	self gtExampleRuntimeContext at: #d put: #d.
	self gtExampleRuntimeContext at: #d2 put: #d2.

	self assert: (self gtExampleRuntimeContext at: #d) = #d.
	self assert: (self gtExampleRuntimeContext at: #d2) = #d2.

	self gtExampleRuntimeContext at: #self ifAbsentPut: [ self ].

	^ self gtExampleRuntimeContext
]
