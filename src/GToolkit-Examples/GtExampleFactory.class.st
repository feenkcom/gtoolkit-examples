"
I am a factory that can create {{gtClass:GtExample}} instances. 

Users should configure me with a #sourceClass:. This is the class used to look for methods defining examples. To create an example, a method defining an example is executed having a provider as a receiver. If the example method is defined on the class side, the provider is the class object. If the method is defined on the instance side, the provider consists in a new instance of that class. In the second case, a new instance is created for running each example method. Optionally users can configure the factory with an explicit provider. If this is done, this provider will be used for all examples created by the factory.

To initialize the subjects of an example I call #gtExampleSubjects on the provider object.
To initialize various properties of an example I detect all pragmas from the example method for which a method exists in class of the example (the method should have the same name as the pragma keyword). Then I execute those methods with the example as a receiver and the pragma arguments.


"
Class {
	#name : #GtExampleFactory,
	#superclass : #Object,
	#instVars : [
		'cache',
		'sourceClass',
		'exampleClass'
	],
	#category : #'GToolkit-Examples-Organization'
}

{ #category : #subjects }
GtExampleFactory class >> classSubjectFrom: aClass [
	^ GtExampleClassSubject fromClass: aClass
]

{ #category : #accessing }
GtExampleFactory class >> gtExampleRuntimeContext [
	^ GtCurrentExampleContext value 
]

{ #category : #subjects }
GtExampleFactory class >> instanceSubjectFromObject: anObject [
	^ GtExampleInstanceSubject fromObject: anObject
]

{ #category : #subjects }
GtExampleFactory class >> subjectFrom: anObject [
	^ anObject isClass
		ifTrue: [ self classSubjectFrom: anObject] 
		ifFalse: [ self instanceSubjectFromObject: anObject ]
]

{ #category : #private }
GtExampleFactory >> allExampleMethodsInClass: currentSourceClass doInstanceSide: aInstanceSideBlock doClassSide: aClassSideBlock [
	"Return all example methods explicitly defined in the given source class and in its superclasses up to, 
	but not including, Object and ProtoObject.
	When the source class is a subclass of Object, Object and ProtoObject are not take into account.
	If the source class is Object or ProtoObject, only example methods in those classes are returned."
	| currentClass |
	currentClass := currentSourceClass.
	self exampleMethodsInClass: currentClass doInstanceSide: aInstanceSideBlock doClassSide: aClassSideBlock.
	currentClass := currentClass superclass.
	[ currentClass isNil or: [currentClass = Object] ] whileFalse: [
		self exampleMethodsInClass: currentClass doInstanceSide: aInstanceSideBlock doClassSide: aClassSideBlock.
		currentClass := currentClass superclass ]
]

{ #category : #public }
GtExampleFactory >> allExamplesDo: aBloc [
	"Traverse all examples defined in the source class and in its superclasses up to, 
	but not including, Object and ProtoObject. If an example method is overriden in one or more classes 
	from the inheritance chain, only one example is created for the example method in the deepest subclass."
	| examplesInstanceSide examplesClassSide |
	
	"Use two separate dictionaries for storing examples on the class/instance side to 
	make it faster to check if an example is defined in a superclass."
	examplesInstanceSide := OrderedDictionary new.
	examplesClassSide := OrderedDictionary new.
	
	"If there is already an example method matching the selector we ignore it, 
	as it means that example is overriden in a subclass, and we do not add it twice."
	self 
		allExampleMethodsInClass: self sourceClass 
		doInstanceSide: [ :aCompiledMethod |
			(examplesInstanceSide includesKey: aCompiledMethod selector) ifFalse: [ 
				self
					exampleFromMethod: aCompiledMethod 
					withProviderClass: self sourceClass instanceSide
					do: [ :example | 
						examplesInstanceSide at: example selector put: example.
						aBloc value: example ] ] ] 
		doClassSide: [ :aCompiledMethod |
			(examplesClassSide includesKey: aCompiledMethod selector) ifFalse: [ 
				self
					exampleFromMethod: aCompiledMethod 
					withProviderClass: self sourceClass classSide
					do: [ :example | 
						examplesClassSide at: example selector put: example.
						aBloc value: example ] ] ]
]

{ #category : #'private-utils' }
GtExampleFactory >> createExample: aCompiledMethod [
	"Create a new example assuming that the provider is the class containing the example method."
	^ self 
		createExampleForMethod: aCompiledMethod 
		withProviderClass: aCompiledMethod methodClass
]

{ #category : #'private-utils' }
GtExampleFactory >> createExampleForMethod: aCompiledMethod withProviderClass: aProviderClass [
	"Create a new example where the provider class is different than the class 
	containing the example method. The method class should however be a direct
	or indirect superclass of the provider class."
	| newExample |
	newExample := self exampleClass new.
	
	"Allow the example to be created even if there is a issues with the relation between the
	method class and the provider class, to facilitate debugging. The resulting example can be inspected,
	but it will not be possible to run it."
	(aProviderClass includesBehavior: aCompiledMethod methodClass) ifFalse: [
		newExample addProblem: (GtExampleInvalidProviderClass new 	
			example: newExample;
			yourself) ]. 
	
	[ newExample 
		initializeFromMethod: aCompiledMethod 
		withProviderClass: aProviderClass
		usingFactory: self 
	]
		on: Deprecation
		do: [ :exception | 
			newExample addProblem: (GtExampleDeprecationDetected new
				example: newExample;
				signaledException: exception; 
				yourself).
			exception resume ].
	^ newExample
]

{ #category : #'accessing-defaults' }
GtExampleFactory >> defaultExampleClass [
	^ GtExample
]

{ #category : #private }
GtExampleFactory >> exampleAt: aCompiledMethod ifAbsentPut: aBlock [
	^ aBlock value
]

{ #category : #accessing }
GtExampleFactory >> exampleClass [
	^ exampleClass ifNil: [ exampleClass := self defaultExampleClass ]
]

{ #category : #accessing }
GtExampleFactory >> exampleClass: anObject [
	exampleClass := anObject
]

{ #category : #private }
GtExampleFactory >> exampleFromMethod: aCompiledMethod withProviderClass: aProviderClass do: aBlock [
	(self isExampleMethod: aCompiledMethod) ifFalse: [ ^ self ].

	aBlock value: (self 
		createExampleForMethod: aCompiledMethod 
		withProviderClass: aProviderClass)
]

{ #category : #private }
GtExampleFactory >> exampleMethod: aCompiledMethod do: aBlock [
	"I am an utility method used to create an example from a compiled method"
	(self isExampleMethod: aCompiledMethod) ifFalse: [ ^ self ].
	self 
		exampleFromMethod: aCompiledMethod 
		withProviderClass: aCompiledMethod methodClass
		do: aBlock
]

{ #category : #private }
GtExampleFactory >> exampleMethodsInClass: aSourceClass do: aBlock [
	self exampleMethodsInClass: aSourceClass doInstanceSide: aBlock doClassSide: aBlock
]

{ #category : #private }
GtExampleFactory >> exampleMethodsInClass: aSourceClass doInstanceSide: aInstanceSideBlock doClassSide: aClassSideBlock [
	aSourceClass instanceSide methods
		select: [ :aCompiledMethod | self isExampleMethod: aCompiledMethod ]
		thenDo: aInstanceSideBlock.
	aSourceClass classSide methods
		select: [ :aCompiledMethod | self isExampleMethod: aCompiledMethod ]
		thenDo: aClassSideBlock.
]

{ #category : #private }
GtExampleFactory >> examplesDo: aBlock [
	"Return examples explicitly defined only in the source class."
	self 
		exampleMethodsInClass: self sourceClass 
		doInstanceSide: [ :aCompiledMethod |
			self
				exampleFromMethod: aCompiledMethod 
				withProviderClass: self sourceClass instanceSide
				do: aBlock ]
		doClassSide: [ :aCompiledMethod |
			self
				exampleFromMethod: aCompiledMethod 
				withProviderClass: self sourceClass classSide
				do: aBlock ]
]

{ #category : #public }
GtExampleFactory >> gtExamplesAllContained [
	"Return examples defined in the source class and its superclasses."
	| examples |
	examples := OrderedCollection new.
	self allExamplesDo: [ :example | examples add: example ].
	^ examples
]

{ #category : #public }
GtExampleFactory >> gtExamplesContained [
	"Return examples explicitly defined only in the source class."
	| examples |
	examples := OrderedCollection new.
	self examplesDo: [ :example | examples add: example ].
	^ examples
]

{ #category : #public }
GtExampleFactory >> gtParametrizedExamplesContained [
	"Return examples explicitly defined only in the source class."
	| examples |
	examples := OrderedCollection new.
	self examplesDo: [ :example | examples add: example ].
	^ examples
]

{ #category : #'private - creating examples' }
GtExampleFactory >> initializeExample: aGTExample fromMethod: aCompiledMethod [
	self initializeSubjectsForExample: aGTExample.
	self initializePragmasFromMethod: aCompiledMethod forExample: aGTExample.

]

{ #category : #'private-init' }
GtExampleFactory >> initializePragmas: aCollection forExample: aGTExample [
	aCollection do: [ :pragma | 
		(aGTExample class canPerform: pragma selector) ifTrue: [
			[ aGTExample perform: pragma selector withArguments: pragma arguments ]
				on: Error
				do: [ :exception | 
					aGTExample addProblem: (GtExamplePragmaError new
						example: aGTExample;
						pragma: pragma;
						signaledException: exception;
						yourself) ] ] ]
]

{ #category : #'private-init' }
GtExampleFactory >> initializePragmasFromMethod: aCompiledMethod forExample: aGTExample [
	self initializePragmas: aCompiledMethod pragmas forExample: aGTExample
]

{ #category : #'private-init' }
GtExampleFactory >> initializeSubject: anExampleSubject forExample: aGTExample [
	[ aGTExample addSubject: (self class subjectFrom: anExampleSubject) ]
		on:Error
		do: [ :exception | 
			aGTExample addProblem: (GtExampleSubjectError new 
				example: aGTExample;
				subject: anExampleSubject;
				signaledException: exception;
				yourself) ] 
]

{ #category : #'private-init' }
GtExampleFactory >> initializeSubjectsForExample: aGTExample [
	[ self subjectsFor: aGTExample do: [ :anExampleSubject | 
			self initializeSubject: anExampleSubject forExample: aGTExample ] ]
		on: Error
		do: [ :exception | 
			aGTExample addProblem: (GtExampleSubjectError new 
				example: aGTExample;
				signaledException: exception;
				yourself) ]
]

{ #category : #testing }
GtExampleFactory >> isExampleMethod: aCompiledMethod [
	^ self isGTExampleMethod: aCompiledMethod 
]

{ #category : #testing }
GtExampleFactory >> isGTExampleMethod: aCompiledMethod [
	^ aCompiledMethod isGTExampleMethod
]

{ #category : #accessing }
GtExampleFactory >> sourceClass [
	^ sourceClass
]

{ #category : #accessing }
GtExampleFactory >> sourceClass: anObject [
	"The class used to locate example methods."
	sourceClass := anObject
]

{ #category : #'private-utils' }
GtExampleFactory >> subjectsFor: anExample do: aBlock [
	"I execute the given action with each subject for this example.
	I use the provider class instead of the method class to take into account inherited examples."
	
	anExample providerClass isInstanceSide 
		ifTrue: [ 
			"If the example is on the instance side its subjects are obtained from the class. 
			Examples on the instance side can choose what classes or objects they want to exemplify."
			anExample providerClass instanceSide gtExamplesSubjects do: aBlock ]
		ifFalse: [ 
			"In case the example is on the class side the subject for that example is the provider class, 
			that is the class used to create the object on which the example is going to be executed." 
			aBlock value: anExample providerClass instanceSide ]
]
