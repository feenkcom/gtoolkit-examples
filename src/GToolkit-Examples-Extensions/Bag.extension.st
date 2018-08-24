Extension { #name : #Bag }

{ #category : #'*GToolkit-Examples-Extensions' }
Bag class >> gtExampleBagWithOneElement [
	<gtExample>
	^ Bag with: 42
]

{ #category : #'*GToolkit-Examples-Extensions' }
Bag class >> gtExampleBagWithTenElements [
	<gtExample>
	^ #(1 2 3 1 2 3 3 4 5 3) asBag
]

{ #category : #'*GToolkit-Examples-Extensions' }
Bag class >> gtExampleEmptyBag [
	<gtExample>
	^ Bag new
]
