private
processAfter: anExample
	| dependencies |
	"anExample == self example ifFalse: [ ^ self ]."
	self processAfterMethodFor: anExample.
	dependencies := OrderedCollection new.
	(anExample traverser 
		action: [ :anotherExample | 
			(dependencies includes: anotherExample) ifFalse: [ 
				dependencies add: anotherExample ] ];
		yourself) value.
	dependencies reversed do: [ :anotherExample |
		self processAfterMethodFor: anotherExample ]