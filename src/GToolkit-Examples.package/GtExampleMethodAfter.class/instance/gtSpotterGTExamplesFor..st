as yet unclassified
gtSpotterGTExamplesFor: aStep
	<spotterOrder: 102>
	aStep listProcessor
		title: 'Examples with after Method ', self gtDisplayString;
		filter: GTNullFilter item: [ :filter :context | 
			GTExampleOrganizer instance examplesDo: [ :cn :s :example |
				(example hasAfter: self) ifTrue: [ filter value: example ] ] ];
		wantsToDisplayOnEmptyQuery: true