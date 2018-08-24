Extension { #name : #GTPlayground }

{ #category : #'*GToolkit-Examples-UI' }
GTPlayground class >> gtExamplesMenuFor: aPlayground [
	<playgroundContextMenu>
	^ GtExamplePlaygroundMenu menuFor: aPlayground
]
