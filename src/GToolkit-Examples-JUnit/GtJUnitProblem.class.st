Class {
	#name : #GtJUnitProblem,
	#superclass : #GtJUnitXmlElement,
	#category : #'GToolkit-Examples-JUnit-Model'
}

{ #category : #accessing }
GtJUnitProblem >> details [
	^ xml contentString
]

{ #category : #'gt - views' }
GtJUnitProblem >> gtDetailsFor: aView [
	<gtView>
	^ aView textEditor
		title: 'Details';
		priority: 10;
		question: 'What diagnostic output or stack trace was recorded?';
		text: [ self details ]
]

{ #category : #accessing }
GtJUnitProblem >> kind [
	^ xml localName asSymbol
]

{ #category : #accessing }
GtJUnitProblem >> message [
	^ xml attributeAt: 'message'
]

{ #category : #accessing }
GtJUnitProblem >> type [
	^ xml attributeAt: 'type'
]
