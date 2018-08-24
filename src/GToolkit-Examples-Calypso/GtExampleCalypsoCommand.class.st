Class {
	#name : #GtExampleCalypsoCommand,
	#superclass : #CmdCommand,
	#instVars : [
		'selectedItems'
	],
	#category : 'GToolkit-Examples-Calypso'
}

{ #category : #testing }
GtExampleCalypsoCommand class >> canBeExecutedInContext: aToolContext [
	^ (super canBeExecutedInContext: aToolContext) and: [ 
		aToolContext selectedItems anySatisfy: [ :each | 
			each hasProperty: GtExampleProperty ] ]
]

{ #category : #accessing }
GtExampleCalypsoCommand class >> contextClass [
	^ self subclassResponsibility
]

{ #category : #activation }
GtExampleCalypsoCommand class >> fullBrowserMenuActivation [
	<classAnnotation>
	^ CmdContextMenuCommandActivation
		byItemOf: GtExampleCalypsoMenuGroup
		order: self menuItemOrder
		for: self contextClass
]

{ #category : #accessing }
GtExampleCalypsoCommand class >> menuItemOrder [
	"Return a number representing order in GToolkit menu group"
	<return: #Number>
	^ self subclassResponsibility
]

{ #category : #accessing }
GtExampleCalypsoCommand class >> tableIconPriority [
	^ 500
]

{ #category : #execution }
GtExampleCalypsoCommand >> execute [
	| examples |
	examples := selectedItems
		flatCollect:
			[ :each | "The property does not work as the collection is not updated on system changes." "(each getProperty: GtExampleProperty) examples" self gtExamplesFrom: each ].
	examples
		ifNotEmpty:
			[ self executeOnExampleGroup: (GtExampleGroup new examples: examples) ]
		ifEmpty: [ self notifyNoExamples ]
]

{ #category : #execution }
GtExampleCalypsoCommand >> executeOnExampleGroup: aGtExampleGroup [ 
	^ self subclassResponsibility
]

{ #category : #private }
GtExampleCalypsoCommand >> gtExamplesFrom: each [
	^ each actualObject gtExamplesContained
]

{ #category : #private }
GtExampleCalypsoCommand >> inspectExamplesOnExampleGroup: aGtExampleGroup [ 
	aGtExampleGroup inspect
]

{ #category : #private }
GtExampleCalypsoCommand >> inspectReturnValuesOnExampleGroup: aGtExampleGroup [ 
	| results |
	results := Dictionary new.
	aGtExampleGroup examples 
		do: [ :eachExampleWithResult | 
			eachExampleWithResult run.
			results at: eachExampleWithResult put: eachExampleWithResult example returnValue ]
		displayingProgress: [ :examples | 
			'Processing ' , aGtExampleGroup examples size asString , ' examples ...' ].
	results inspect.
]

{ #category : #private }
GtExampleCalypsoCommand >> notifyNoExamples [
	GrowlMorph 
		openWithLabel: 'GT Examples'
		contents: 'No examples found within the current selection' 
]

{ #category : #execution }
GtExampleCalypsoCommand >> prepareFullExecutionInContext: aToolContext [
	super prepareFullExecutionInContext: aToolContext.
	selectedItems := aToolContext selectedItems.
]

{ #category : #icons }
GtExampleCalypsoCommand >> tableCellIcon [
	^ #glamorousGreenCircle asIcon
]
