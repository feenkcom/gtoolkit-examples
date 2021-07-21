Extension { #name : 'RBBrowserEnvironment' }

{ #category : '*GToolkit-Examples-Core' }
RBBrowserEnvironment >> gtExamplesContained [
	| examples |
	examples := OrderedCollection new.
	self methodsDo: [ :each | 
		(each methodClass  isTrait not and: [ each isGTExampleMethod]) 
			ifTrue: [ 
				each gtExample ifNotNil: [ :example | 
					examples add: example ] ] ].
	^ examples
]

{ #category : '*GToolkit-Examples-Core' }
RBBrowserEnvironment >> gtParametrizedExamplesContained [
	| examples |
	examples := OrderedCollection new.
	self methodsDo: [ :each | 
		(each methodClass isTrait not and: [ each isGTParametrizedExampleMethod ]) 
			ifTrue: [ 
				each gtExample ifNotNil: [ :example | 
					examples add: example ] ] ].
	^ examples
]
