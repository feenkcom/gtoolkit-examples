Class {
	#name : #GtExamplesExamplesWithinPackages,
	#superclass : #GtExampleProvider,
	#category : #'GToolkit-Tests-Examples'
}

{ #category : #examples }
GtExamplesExamplesWithinPackages >> allExamplesInDummyPackageFour [
	<gtExample>
	| examples |
	examples := 'GToolkit-Examples-Dummies-Package4' asPackage gtExamplesAllContained.
	self 
		assertExamples: examples 
		withSelectors: #(
			exampleClassBPackage1
			exampleExtensionMethodForClassBDefinedInPackage3
			exampleInAbstractClassFInPackage4
			exampleRootClassPackage1 ).
	^ examples
]

{ #category : #examples }
GtExamplesExamplesWithinPackages >> allExamplesInDummyPackageOne [
	<gtExample>
	| examples |
	examples := 'GToolkit-Examples-Dummies-Package1' asPackage gtExamplesAllContained.
	self 
		assertExamples: examples 
		withSelectors: #(
			exampleClassBPackage1 
			exampleExtensionMethodForClassBDefinedInPackage3 
			exampleRootClassPackage1 
			exampleRootClassPackage1).
	^ examples
]

{ #category : #examples }
GtExamplesExamplesWithinPackages >> allExamplesInDummyPackageThree [
	<gtExample>
	| examples |
	examples := 'GToolkit-Examples-Dummies-Package3' asPackage gtExamplesAllContained.
	self 
		assertExamples: examples 
		withSelectors: #(
			exampleClassBPackage1
			exampleExtensionMethodForClassBDefinedInPackage3
			exampleRootClassPackage1).
	^ examples
]

{ #category : #examples }
GtExamplesExamplesWithinPackages >> allExamplesInDummyPackageTwo [
	<gtExample>
	| examples |
	examples := 'GToolkit-Examples-Dummies-Package2' asPackage gtExamplesAllContained.
	self 
		assertExamples: examples 
		withSelectors: #(
			exampleClassAPackage2 
			exampleClassAPackage2
			exampleExtensionMethodForClassADefinedInPackage3
			exampleExtensionMethodForClassADefinedInPackage3
			exampleRootClassPackage1
			exampleRootClassPackage1).
	^ examples
]

{ #category : #asserting }
GtExamplesExamplesWithinPackages >> assertExamples: currentExamples withSelectors: expectedSelectors [
	| obtainedSelectors |
	obtainedSelectors := (currentExamples collect: #selector) asArray sorted: [ :a :b | a < b ].
	self assert: obtainedSelectors size equals: expectedSelectors size.
	self assert: obtainedSelectors equals: expectedSelectors.
]

{ #category : #examples }
GtExamplesExamplesWithinPackages >> examplesInDummyPackageFour [
	<gtExample>
	| examples |
	examples := 'GToolkit-Examples-Dummies-Package4' asPackage gtExamplesContained.
	self 
		assertExamples: examples 
		withSelectors: #().
	^ examples
]

{ #category : #examples }
GtExamplesExamplesWithinPackages >> examplesInDummyPackageOne [
	<gtExample>
	| examples |
	examples := 'GToolkit-Examples-Dummies-Package1' asPackage gtExamplesContained.
	self 
		assertExamples: examples 
		withSelectors: #(exampleClassBPackage1 exampleExtensionMethodForClassBDefinedInPackage3 exampleRootClassPackage1).
	^ examples
]

{ #category : #examples }
GtExamplesExamplesWithinPackages >> examplesInDummyPackageThree [
	<gtExample>
	| examples |
	examples := 'GToolkit-Examples-Dummies-Package3' asPackage gtExamplesContained.
	self 
		assertExamples: examples 
		withSelectors: #().
	^ examples
]

{ #category : #examples }
GtExamplesExamplesWithinPackages >> examplesInDummyPackageTwo [
	<gtExample>
	| examples |
	examples := 'GToolkit-Examples-Dummies-Package2' asPackage gtExamplesContained.
	self 
		assertExamples: examples 
		withSelectors: #(exampleClassAPackage2 exampleExtensionMethodForClassADefinedInPackage3).
	^ examples
]
