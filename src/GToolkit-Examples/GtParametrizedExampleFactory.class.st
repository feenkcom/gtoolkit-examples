Class {
	#name : #GtParametrizedExampleFactory,
	#superclass : #GtExampleFactory,
	#category : #'GToolkit-Examples-Organization'
}

{ #category : #'accessing-defaults' }
GtParametrizedExampleFactory >> defaultExampleClass [
	^ GtParametrizedExample
]

{ #category : #testing }
GtParametrizedExampleFactory >> isExampleMethod: aCompiledMethod [
	^ self isGtParametrizedExampleMethod: aCompiledMethod 
]

{ #category : #testing }
GtParametrizedExampleFactory >> isGtParametrizedExampleMethod: aCompiledMethod [ 
	^ aCompiledMethod isGTParametrizedExampleMethod
]
