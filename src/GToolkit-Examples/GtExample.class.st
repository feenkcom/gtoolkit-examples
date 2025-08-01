"
I represent the concept of an example.

I am constructed out of a method that returns an object. I hold the meta-information about that method and I know how to construct the concrete resulting object that is returned by the method. 

I can depend on other examples, and other examples can depend on me. When I depend on another example, the code that produces me uses the result of the other example to construct me.

The class for which I represent the example is called my subject. I can have multiple subjects.

The object on which I am executed is the provider. This is obtained using the provider class. The class that offers the method out of which I am constructed is the method class. The provider class and the method class are not the same in case of inherited examples. For them, the provider class can be a subclass of the method class. In this case the method resides in a superclass and is executed on an instance of the subclass.

I also know how to handle possible exceptions, which makes me a great candidate for encoding assumptions that are otherwise expressed as classic tests.


"
Class {
	#name : #GtExample,
	#superclass : #Object,
	#instVars : [
		'providerClass',
		'methodClass',
		'selector',
		'label',
		'description',
		'form',
		'exceptions',
		'subjects',
		'children',
		'properties',
		'after',
		'problems',
		'timeLimit'
	],
	#category : #'GToolkit-Examples-Core'
}

{ #category : #comparing }
GtExample >> = anExample [
	^ self class = anExample class and: [ 
		self providerClass = anExample providerClass and: [ 
			self methodClass = anExample methodClass and: [ 
				self selector = anExample selector ] ] ]
]

{ #category : #adding }
GtExample >> addProblem: aProblem [
	problems add: aProblem
]

{ #category : #adding }
GtExample >> addSubject: aGTExampleSubject [
	subjects add: aGTExampleSubject asGTExampleSubject
]

{ #category : #accessing }
GtExample >> after [
	^ after
]

{ #category : #'PRAGMA-SELECTORS' }
GtExample >> after: aSelector [
	<gtExamplePragma>
	<description: 'A method, implemented by the given selector, to be performed after this example has run ~ similar but not identical to teardown of sunit'>
	
	after := self methodResolverClass resolve: GtExampleMethodAfter example: self selector: aSelector
]

{ #category : #dependencies }
GtExample >> allDependencies [
	| examples |
	examples := Set new.
	(self traverser
		action: [ :example | examples add: example ];
		yourself) value.
	^ examples
]

{ #category : #'accessing-dynamic' }
GtExample >> asCachedExampleWithResult [
	| aMethod |
	self exists ifFalse: [ ^ self asExampleWithResult ].

	aMethod := self method.

	self providerClass = self methodClass ifTrue: [ ^ aMethod gtExampleWithResult ].

	^ aMethod gtExampleWithResultForExample: self
]

{ #category : #'accessing-dynamic' }
GtExample >> asExampleWithResult [
	^ GtExampleWithResult new example: self
]

{ #category : #testing }
GtExample >> canBeExecuted [
	"Return true if example can be executed"
	<return: #Boolean>
	^ self exists and: [ self hasProblems not ]
]

{ #category : #accessing }
GtExample >> changeArguments: aCollection [
	"Indicate that no arguments were changed"
	^ false
]

{ #category : #printing }
GtExample >> classLabel [
	^ String streamContents: [ :aStream |
		self printClassLabelOn: aStream ]
]

{ #category : #private }
GtExample >> classResolverClass [
	^ GtExampleClassResolver
]

{ #category : #actions }
GtExample >> debug [
	^ self debugger result
]

{ #category : #'accessing-dynamic' }
GtExample >> debugger [
	^ GtExampleDebugger new 
		example: self;
		yourself
]

{ #category : #accessing }
GtExample >> defaultTimeLimit [
	^ 1 minute
]

{ #category : #private }
GtExample >> dependencyResolverClass [
	^ GtExampleDependenciesResolver
]

{ #category : #accessing }
GtExample >> description [
	^ description
]

{ #category : #'PRAGMA-SELECTORS' }
GtExample >> description: aString [
	<gtExamplePragma>
	<description: 'A full description of this example'>
	
	description := aString
]

{ #category : #'accessing-dynamic' }
GtExample >> directDependencies [
	"I return the list of examples directly used within this example. The returned order is the one in which 
	method calls denoting a dependency are present within the method defining this example. If an example is
	reference multiple time I include it only once."
	^ self dependencyResolverClass resolveDependenciesForExample: self
]

{ #category : #TODO }
GtExample >> directDependents [
	^ #()
]

{ #category : #'accessing-dynamic' }
GtExample >> evaluationContext [
	<return: #GtExampleEvaluationContext>
	^ GtExampleEvaluationContext new 
			provider: self provider;
			arguments: #()
]

{ #category : #'accessing-dynamic' }
GtExample >> evaluator [
	^ GtExampleEvaluator new 
		example: self;
		yourself
]

{ #category : #accessing }
GtExample >> exceptions [
	^ exceptions
]

{ #category : #testing }
GtExample >> exists [
	^ self methodClass includesSelector: self selector
]

{ #category : #private }
GtExample >> form [
	form
]

{ #category : #private }
GtExample >> form: anIcon [
	form := anIcon
]

{ #category : #printing }
GtExample >> gtDisplayOn: aStream [
	
	self printClassLabelOn: aStream.
	aStream 
		nextPutAll: ' >> '; 
		print: self selector.
		
	self gtDisplayValidityOn: aStream
]

{ #category : #printing }
GtExample >> gtDisplayValidityOn: aStream [
	self isValid ifTrue: [ ^ self ].
	
	aStream nextPutAll: ' [invalid]'
]

{ #category : #'PRAGMA-SELECTORS' }
GtExample >> gtExample [
	<gtExamplePragma>
	<description: 'This method is turned into a gtExample if provided'>
	
	^ self
]

{ #category : #testing }
GtExample >> hasAfter [
	^ after notNil
]

{ #category : #accessing }
GtExample >> hasAfterInDependencies [
	^ self hasAfter or: [ self allDependencies anySatisfy: #hasAfter ]
]

{ #category : #testing }
GtExample >> hasDependencies [
	^ self directDependencies notEmpty
]

{ #category : #testing }
GtExample >> hasInternalProblems [
	^ problems notEmpty
]

{ #category : #testing }
GtExample >> hasLiteralThorough: aLiteral [
	^ self methodClass = aLiteral
		or: [ self selector = aLiteral
			or: [ (self label notNil and: [ self label includesSubstring: aLiteral asString caseSensitive: false ])
				or: [ (self description notNil and: [ self description includesSubstring: aLiteral asString caseSensitive: false ])
					or: [ (self subjects anySatisfy: [ :each | each hasLiteralThorough: aLiteral ])
						or: [ self exists and: [ self method hasLiteralThorough: aLiteral asSymbol ] ] ] ] ] ]
]

{ #category : #testing }
GtExample >> hasNoTestPragma [
	^ self method hasPragmaNamed: #noTest
]

{ #category : #testing }
GtExample >> hasProblems [
	^ problems notEmpty
			or: [  self hasValidAfter not
				or: [ self hasValidDependencies not ] ]
]

{ #category : #testing }
GtExample >> hasSubject: aSubject [
	^ self subjects anySatisfy: [ :each | 
		each == aSubject 
			or: [ each = aSubject ] ]
]

{ #category : #testing }
GtExample >> hasSubjects [
	^ self subjects notEmpty
]

{ #category : #testing }
GtExample >> hasValidAfter [
	^ self hasAfter not
		or: [ self after isValid ]
]

{ #category : #testing }
GtExample >> hasValidDependencies [
	| currentDependencies |
	currentDependencies := self directDependencies.
	^  currentDependencies isEmpty 
			or: [ currentDependencies allSatisfy: #exists ]
]

{ #category : #testing }
GtExample >> hasValidProviderClass [
	^ self providerClass includesBehavior: self methodClass
]

{ #category : #comparing }
GtExample >> hash [
	^ ((self class hash * 3
		bitXor: self providerClass hash * 5)
			bitXor: self methodClass hash * 7)
				bitXor: self selector hash * 13
]

{ #category : #accessing }
GtExample >> icon [
	^ form ifNotNil: [ form form ]
]

{ #category : #'PRAGMA-SELECTORS' }
GtExample >> icon: aSelector [
	<gtExamplePragma>
	<description: 'Attach an icon to this example. The selector must be implemented by the currently active theme'>

	self iconThemeSelector: aSelector
]

{ #category : #'PRAGMA-SELECTORS' }
GtExample >> iconBase64: aString [
	<gtExamplePragma>
	<description: 'Attach an icon to this example. The icon form is described by the given base64-encoded string'>
	
	form := GtExampleFormIcon fromBase64String: aString
]

{ #category : #'PRAGMA-SELECTORS' }
GtExample >> iconBytes: aByteArray [
	<gtExamplePragma>
	<description: 'Attach an icon to this example. The icon form is described by the given byte-array'>
	
	form := GtExampleFormIcon fromByteArray: aByteArray
]

{ #category : #'PRAGMA-SELECTORS' }
GtExample >> iconClass: aClassOrClassName selector: aSelector [
	<gtExamplePragma>
	<description: 'Attach an icon to this example. The method described by the given class and selector must return an icon form'>
	
	form := self methodResolverClass resolve: GtExampleMethodIcon example: self className: aClassOrClassName meta: false selector: aSelector
]

{ #category : #'PRAGMA-SELECTORS' }
GtExample >> iconMetaClass: aClassOrClassName selector: aSelector [
	<gtExamplePragma>
	<description: 'Attach an icon to this example. The method described by the given meta-class and selector must return an icon form'>
	
	form := self methodResolverClass resolve: GtExampleMethodIcon example: self className: aClassOrClassName meta: true selector: aSelector
]

{ #category : #'PRAGMA-SELECTORS' }
GtExample >> iconSelector: aSelector [
	<gtExamplePragma>
	<description: 'Attach an icon to this example. The selector must return an icon form'>
	
	form := (self methodResolverClass resolve: GtExampleMethodIcon example: self selector: aSelector)
		converter: #convertFromByteArray:;
		yourself
]

{ #category : #'PRAGMA-SELECTORS' }
GtExample >> iconSelectorBase64: aSelector [
	<gtExamplePragma>
	<description: 'Attach an icon to this example. The icon form is described by the base64 string returned by the given selector'>
	
	form := (self methodResolverClass resolve: GtExampleMethodIcon example: self selector: aSelector)
		converter: #convertFromBase64String:;
		yourself
]

{ #category : #'PRAGMA-SELECTORS' }
GtExample >> iconThemeSelector: aSelector [
	<gtExamplePragma>
	<description: 'Attach an icon to this example. The selector must be implemented by the currently active theme'>
	
	form := GtExampleThemeIcon fromSelector: aSelector
]

{ #category : #testing }
GtExample >> ignoreTest [
	^ self propertyAt: #noTest ifAbsent: [ false ]
]

{ #category : #testing }
GtExample >> ignoreTestReport [
	^ self propertyAt: #noTestReport ifAbsent: [ false ]
]

{ #category : #initialization }
GtExample >> initialize [
	super initialize.
	
	children := OrderedCollection new.
	subjects := Set new.
	problems := Set new.
	exceptions := ExceptionSet new.	
	properties := IdentityDictionary new.
]

{ #category : #initialization }
GtExample >> initializeFromMethod: aCompiledMethod withProviderClass: aProviderClass usingFactory: aGTExampleFactory [
	methodClass := aCompiledMethod methodClass.
	selector := aCompiledMethod selector.
	providerClass := aProviderClass.
	aGTExampleFactory initializeExample: self fromMethod: aCompiledMethod
]

{ #category : #testing }
GtExample >> isGTExample [
	^ true
]

{ #category : #testing }
GtExample >> isInherited [
	^ self methodClass ~~ self providerClass
]

{ #category : #testing }
GtExample >> isMethodDefined [
	^ self methodClass includesSelector: self selector
]

{ #category : #testing }
GtExample >> isValid [
	^ self isMethodDefined and: [
		self hasProblems not
			and: [ self hasValidProviderClass 
				and: [ self traverser canProcess ] ] ]
]

{ #category : #accessing }
GtExample >> label [
	^ label
]

{ #category : #'PRAGMA-SELECTORS' }
GtExample >> label: aString [
	<gtExamplePragma>
	<description: 'A short identifier = name of this example'>
	
	label := aString
]

{ #category : #testing }
GtExample >> matchesMethod: aCompiledMethod [
	^ aCompiledMethod class = CompiledMethod
		and: [ self methodClass = aCompiledMethod methodClass
			and: [ self selector = aCompiledMethod selector ] ]
]

{ #category : #'accessing-dynamic' }
GtExample >> method [
	^ self methodClass >> self selector
]

{ #category : #accessing }
GtExample >> methodClass [
	^ methodClass
]

{ #category : #'accessing-dynamic' }
GtExample >> methodDo: aBlockClosure [ 
	self isMethodDefined ifFalse: [ ^ self ].
	aBlockClosure cull: self method
]

{ #category : #accessing }
GtExample >> methodPackage [
	<return: #Package>
	^ self method package
]

{ #category : #'accessing-dynamic' }
GtExample >> methodProtocol [
	"Return method protocol"
	<return: #Symbol>
	^ self method protocol   
]

{ #category : #private }
GtExample >> methodResolverClass [
	^ GtExampleMethodResolver
]

{ #category : #'PRAGMA-SELECTORS' }
GtExample >> noTest [
	<gtExamplePragma>
	<description: 'Do not run this example while running SUnit tests'>
	
	self propertyAt: #noTest put: true
]

{ #category : #'PRAGMA-SELECTORS' }
GtExample >> noTestReport [
	<gtExamplePragma>
	<description: 'Do not run this example while running HDTestReport (not yet implemented)'>
	
	self propertyAt: #noTestReport put: true
]

{ #category : #accessing }
GtExample >> numberOfRequieredArguments [
	^ 0
]

{ #category : #actions }
GtExample >> openDebugger [
	^ self openingDebugger result
]

{ #category : #'accessing-dynamic' }
GtExample >> openingDebugger [
	^ GtExampleOpenDebugger new 
		example: self;
		yourself
]

{ #category : #printing }
GtExample >> printClassLabelOn: aStream [
	aStream print: self providerClass.
	(self providerClass ~= self methodClass) ifTrue: [
		aStream 
			nextPutAll: '('; 
			print: self methodClass;
			nextPutAll: ')' ]
]

{ #category : #accessing }
GtExample >> problems [
	^ problems
]

{ #category : #accessing }
GtExample >> propertyAt: aKey ifAbsent: aBlock [
	^ properties at: aKey ifAbsent: aBlock
]

{ #category : #accessing }
GtExample >> propertyAt: aKey put: aValue [
	^ properties at: aKey put: aValue
]

{ #category : #'accessing-dynamic' }
GtExample >> provider [
	^ self providerClass isMeta
		ifTrue: [ self providerClass instanceSide ]
		ifFalse: [ self providerClass instanceSide new ]
]

{ #category : #accessing }
GtExample >> providerClass [
	^ providerClass
]

{ #category : #'accessing-dynamic' }
GtExample >> result [
	<return: #GtExampleResult>
	^ self run
]

{ #category : #'accessing-dynamic' }
GtExample >> returnValue [
	^ self result returnValue
]

{ #category : #actions }
GtExample >> run [
	<return: #GtExampleResult>
	^ self evaluator result
]

{ #category : #actions }
GtExample >> runThenDo: aBlock1 onErrorDo: aBlock2 [
	| result |
	^ (result := self run) isSuccess 
		ifTrue: [ aBlock1 value: result ]
		ifFalse: [ aBlock2 value: result ]
]

{ #category : #accessing }
GtExample >> selector [
	^ selector
]

{ #category : #testing }
GtExample >> shouldLogWithEpicea [
	^ self method isNotNil and: [ self method hasPragmaNamed: #shouldLogWithEpicea ]
]

{ #category : #'accessing-dynamic' }
GtExample >> sourceCode [
	^ self method sourceCode
]

{ #category : #'PRAGMA-SELECTORS' }
GtExample >> subject: aClassOrClassName [
	<gtExamplePragma>
	<description: 'Add a class-subject to the example'>
	
	self subjectClass: aClassOrClassName
]

{ #category : #'PRAGMA-SELECTORS' }
GtExample >> subjectClass: aClassOrClassName [
	<gtExamplePragma>
	<description: 'Add a class-subject to the example'>
	
	self addSubject: (self classResolverClass resolve: GtExampleClassSubject example: self className: aClassOrClassName meta: false)
]

{ #category : #'PRAGMA-SELECTORS' }
GtExample >> subjectMetaClass: aClassOrClassName [
	<gtExamplePragma>
	<description: 'Add a meta-class-subject to the example'>
	
	self addSubject: (self classResolverClass resolve: GtExampleClassSubject example: self className: aClassOrClassName meta: true)
]

{ #category : #accessing }
GtExample >> subjects [
	^ subjects asArray
]

{ #category : #accessing }
GtExample >> timeLimit [
	^ timeLimit ifNil: [ ^ self defaultTimeLimit ]
]

{ #category : #'PRAGMA-SELECTORS' }
GtExample >> timeLimit: milliSecondsValue [
	<gtExamplePragma>
	<description: 'The timeout for the example in milliseconds'>
	
	timeLimit :=  milliSecondsValue milliSeconds
]

{ #category : #'accessing-dynamic' }
GtExample >> traverser [
	^ GtExampleTraverser new 
		example: self;
		yourself
]
