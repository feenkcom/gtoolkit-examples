Extension { #name : #MethodModified }

{ #category : #'*GToolkit-Examples-Extensions' }
MethodModified class >> gtExampleMethodModified [
	" this is a fake annoucement, we just pick 2 arbitrary methods "
	<gtExample>
	<label: 'Diff old and new method'>
	
	^ MethodModified new 
		oldMethod: (MethodModified >> #gtMethodDiffIn:);
		method: (MethodModified class >> #gtExampleMethodModified);
		yourself
]
