"
As my superclass, I add new example methods and override existing ones.


"
Class {
	#name : #GtDummyExamplesWithInheritanceSubclassOfSubclassA,
	#superclass : #GtDummyExamplesWithInheritanceSubclassA,
	#category : #'GToolkit-Examples-Dummies-Data'
}

{ #category : #examples }
GtDummyExamplesWithInheritanceSubclassOfSubclassA >> exampleA [
	<gtExample>
	<return: #ByteString>
	^ 'aaa'
]

{ #category : #examples }
GtDummyExamplesWithInheritanceSubclassOfSubclassA >> exampleB [
	<gtExample>
	<return: #ByteString>
	^ 'bbb'
]

{ #category : #examples }
GtDummyExamplesWithInheritanceSubclassOfSubclassA >> exampleD [
	<gtExample>
	<return: #ByteString>
	^ 'ddd'
]

{ #category : #examples }
GtDummyExamplesWithInheritanceSubclassOfSubclassA >> exampleE [
	<gtExample>
	<return: #ByteString>
	^ 'eee'
]
