Extension { #name : #Deprecation }

{ #category : #'*GToolkit-Examples' }
Deprecation >> messageTextForFrozenException [
	^String streamContents: [ :str |
		self shouldTransform ifTrue: [ 
			str nextPutAll:  'Automatic deprecation code rewrite: '].
		str 
			nextPutAll: 'The method ';
			nextPutAll: self deprecatedMethodName;
			nextPutAll: ' called from ';
			nextPutAll: (self contextOfSender  
				ifNil: [ '<unknown>' ]
				ifNotNil: [ self sendingMethodName]);
			nextPutAll: ' has been deprecated. ';
		 	nextPutAll: explanationString]
]
