Extension { #name : #MCPackage }

{ #category : #'*GToolkit-Examples-Extensions' }
MCPackage class >> gtExampleNoPackage [
	<gtExample>
	<label: 'Metacello package without corresponding RPackage'>
	
	^ MCPackage named: 'No-correspondingRPackage-For-This-MCPackage'
]

{ #category : #'*GToolkit-Examples-Extensions' }
MCPackage class >> gtExamplePackage [
	<gtExample>
	<label: 'Metacello package with corresponding RPackage'>
	
	MCWorkingCopy allManagers do: [ :each | 
		each packageName = 'GT-Examples' ifTrue: [ ^ each package ] ].
	^ nil
]
