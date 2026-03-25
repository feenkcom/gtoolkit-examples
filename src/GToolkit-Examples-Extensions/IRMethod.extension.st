Extension { #name : #IRMethod }

{ #category : #'*GToolkit-Examples-Extensions' }
IRMethod classSide >> gtExampleNewMethod [
	<gtExample>
	^ IRBuilder new 
		addTemps: #(a);
		pushReceiver;
		pushLiteral: 1;
		storeTemp: #a;
		ir
]

{ #category : #'*GToolkit-Examples-Extensions' }
IRMethod classSide >> gtExampleThisMethod [
	<gtExample>
	^ (self class >> #gtExampleThisMethod) ast ir
]
