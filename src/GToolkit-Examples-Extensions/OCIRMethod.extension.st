Extension { #name : #OCIRMethod }

{ #category : #'*GToolkit-Examples-Extensions' }
OCIRMethod >> gtExampleNewMethod [
	<gtExample>
	^ IRBuilder new 
		addTemps: #(a);
		pushReceiver;
		pushLiteral: 1;
		storeTemp: #a;
		ir
]

{ #category : #'*GToolkit-Examples-Extensions' }
OCIRMethod >> gtExampleThisMethod [
	<gtExample>
	^ (self class >> #gtExampleThisMethod) ast ir
]
