*GToolkit-Examples-UI
gtBrowseFor: aString
	| browser |
	metaClassSelectors keysAndValuesDo: [ :class :selectors | 
		classSelectors at: class ifAbsentPut: [ IdentitySet new ] ].
	browser := self browse.
	browser ui 
		title: aString; 
		packageSearchUpdate: ''.
	^ browser