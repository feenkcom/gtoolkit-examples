Extension { #name : #IRMethod }

{ #category : #'*GToolkit-Examples-Pharo12Extensions' }
IRMethod class >> gtExampleNewMethod [
	<gtExample>
	^ IRBuilder new 
		addTemps: #(a);
		pushReceiver;
		pushLiteral: 1;
		storeTemp: #a;
		ir
]

{ #category : #'*GToolkit-Examples-Pharo12Extensions' }
IRMethod class >> gtExampleThisMethod [
	<gtExample>
	^ (self class >> #gtExampleThisMethod) ast ir
]
