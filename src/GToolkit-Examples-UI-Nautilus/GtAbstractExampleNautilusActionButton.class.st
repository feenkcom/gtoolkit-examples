"
I add a method icon in Nautilus for exampe methods, that can be used to run the example. The actual action to be executed is defined by my subclass.
"
Class {
	#name : #GtAbstractExampleNautilusActionButton,
	#superclass : #AbstractMethodIconAction,
	#classVars : [
		'CurrentAction'
	],
	#category : 'GToolkit-Examples-UI-Nautilus'
}

{ #category : #accessing }
GtAbstractExampleNautilusActionButton class >> currentAction [
	^ CurrentAction ifNil: [ CurrentAction := GtExampleNautilusActionButton ]
]

{ #category : #accessing }
GtAbstractExampleNautilusActionButton class >> currentAction: anObject [
	MethodWidget methodsIconsCache removeAll.
	CurrentAction := anObject
]

{ #category : #private }
GtAbstractExampleNautilusActionButton class >> iconForMethod: aCompiledMethod result: aResult [
	aResult
		ifNil: [ ^ Smalltalk ui icons iconNamed: #testNotRunIcon ].
	aResult isSuccess
		ifTrue: [ ^ Smalltalk ui icons iconNamed: #testGreenIcon ].
	aResult isFailure
		ifTrue: [ ^ Smalltalk ui icons iconNamed: #testYellowIcon ].
	aResult isError
		ifTrue: [ ^ Smalltalk ui icons iconNamed: #testRedIcon ].
	^ Smalltalk ui icons iconNamed: #testNotRunIcon
]

{ #category : #testing }
GtAbstractExampleNautilusActionButton class >> isAbstract [
	^ self == GtAbstractExampleNautilusActionButton 
]

{ #category : #testing }
GtAbstractExampleNautilusActionButton class >> isEnabled [
	^ self currentAction == self
]

{ #category : #private }
GtAbstractExampleNautilusActionButton class >> methodUpdated: aCompiledMethod with: aResult [
	self currentAction ifNil: [ ^ self ].
	
	[ self currentAction methodUpdated: aCompiledMethod with: aResult ]
		on: Error
		do: [ " ignore " ].
	
	[ NautilusUI allSubInstances do: #updateCategoryAndMethodList ]
		on: Error 
		do: [ " ignore " ]
]

{ #category : #order }
GtAbstractExampleNautilusActionButton >> actionOrder [
	"Return the priority of this action"
	
	^ 0
]

{ #category : #order }
GtAbstractExampleNautilusActionButton >> isActionHandled [
	^ self class isAbstract not 
		and: [ self class isEnabled
			and: [ method methodClass isTrait not
				and: [ method isGTExampleMethod ] ] ]
]
