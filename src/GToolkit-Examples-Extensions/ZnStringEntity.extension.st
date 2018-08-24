Extension { #name : #ZnStringEntity }

{ #category : #'*GToolkit-Examples-Extensions' }
ZnStringEntity class >> gtExampleEmptyHtml [
	<gtExample>
	<label: 'Empty HTML'>
	
	^ self html: ''
]

{ #category : #'*GToolkit-Examples-Extensions' }
ZnStringEntity class >> gtExampleEmptyText [
	<gtExample>
	<label: 'Empty text'>
	
	^ self text: ''
]

{ #category : #'*GToolkit-Examples-Extensions' }
ZnStringEntity class >> gtExampleEmptyXml [
	<gtExample>
	<label: 'Empty XML'>
	
	^ self xml: ''
]

{ #category : #'*GToolkit-Examples-Extensions' }
ZnStringEntity class >> gtExampleHtml [
	<gtExample>
	<label: 'HTML'>
	
	^ self html: '<p><b>Hello</b> <i>World<i></p>'
]

{ #category : #'*GToolkit-Examples-Extensions' }
ZnStringEntity class >> gtExampleText [
	<gtExample>
	<label: 'Text'>
	
	^ self text: 'Hello World'
]

{ #category : #'*GToolkit-Examples-Extensions' }
ZnStringEntity class >> gtExampleXml [
	<gtExample>
	<label: 'XML'>
	
	^ self xml: '<message>Hello World</message>'
]
