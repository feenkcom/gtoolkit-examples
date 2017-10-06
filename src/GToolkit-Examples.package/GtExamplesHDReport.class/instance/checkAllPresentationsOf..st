running
checkAllPresentationsOf: exampleToTest
	| browser window failedSelectors |
	exampleToTest class name = #ProtoObject ifTrue: [ ^ self ]. " no longer implemented "
	failedSelectors := OrderedCollection new.
	(Pragma
		allNamed: #gtInspectorPresentationOrder:
		from: exampleToTest class
		to: ProtoObject)
		do: [ :eachPragma | 
			browser := GLMWrapper new.
			 [ browser
				show: [ :composite | 
					(eachPragma methodSelector findTokens: $:) size = 1
						ifTrue: [ exampleToTest perform: eachPragma methodSelector with: composite ].
					(eachPragma methodSelector findTokens: $:) size = 2
						ifTrue: [ exampleToTest
								perform: eachPragma methodSelector
								with: composite
								with: browser ] ].
			window := browser openOn: exampleToTest ]
				on: Error
				do: [ :err | failedSelectors add: eachPragma methodSelector -> err ] 
			].
		window ifNotNil: [ window delete ].
		^ failedSelectors.