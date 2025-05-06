Class {
	#name : #GtExampleReturnPragmaBrowser,
	#superclass : #Object,
	#instVars : [
		'packagesMissingReturnPragmas'
	],
	#category : #'GToolkit-Examples-Utilities'
}

{ #category : #views }
GtExampleReturnPragmaBrowser >> gtPackagesWIthExamplesFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Example Packages';
		priority: 10;
		items: [ self packagesWithExamples ];
		column: 'Index'
			text: [ :eachItem :eachIndex | eachIndex asRopedText foreground: Color gray ]
			width: 45;
		column: 'Class' text: [ :each | each gtDisplayString ]
		width: 300;
		column: '# Examples' text: [ :each | each gtExamplesContained size ];
		actionUpdateButton
]

{ #category : #views }
GtExampleReturnPragmaBrowser >> gtViewFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Packages missing return:';
		priority: 20;
		items: [ self packagesMissingReturnPragmas ];
		column: 'Index'
			text: [ :eachItem :eachIndex | eachIndex asRopedText foreground: Color gray ]
			width: 45;
		column: 'Package'
			text: [ :each | each key ]
			width: 300;
		column: '# missing'
			text: [ :each | each value size ]
			width: 300;
		send: [ :each | each value ];
		actionUpdateButton
]

{ #category : #accessing }
GtExampleReturnPragmaBrowser >> packagesMissingReturnPragmas [
	^ packagesMissingReturnPragmas
		ifNil: [ packagesMissingReturnPragmas := Smalltalk packages
					collect: [ :p | p -> p gtExamplesWithoutReturnPragmas ]
					thenSelect: [ :kv | kv value notEmpty ] ]
]

{ #category : #accessing }
GtExampleReturnPragmaBrowser >> packagesWithExamples [
	^ (Smalltalk packages select: #hasGtExamples) sorted
]
