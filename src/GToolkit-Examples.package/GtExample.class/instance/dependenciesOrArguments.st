accessing-dynamic
dependenciesOrArguments
	| exampleMethod possibleExamples |
	possibleExamples := OrderedCollection new.
	exampleMethod := self method.
	exampleMethod ast nodesDo: [ :aNode | 
		aNode isMessage ifTrue: [
			aNode isSelfSend ifTrue: [ 
				possibleExamples add: (exampleMethod methodClass lookupSelector: aNode selector) ].
			aNode isSuperSend ifTrue: [  
				possibleExamples add: (exampleMethod methodClass superclass lookupSelector: aNode selector) ] ] ].
	
	^ ((possibleExamples 
		select: [ :aMethod | aMethod isGTExampleMethod ])
		collect: [ :aMethod | aMethod gtExample ]) asOrderedCollection