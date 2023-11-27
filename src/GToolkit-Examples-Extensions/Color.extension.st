Extension { #name : #Color }

{ #category : #'*GToolkit-Examples-Extensions' }
Color class >> gtExampleColorRed [
	<gtExample>
	
	^ Color red
]

{ #category : #'*GToolkit-Examples-Extensions' }
Color class >> gtExampleTvTestColorBars [
	<gtExample>
	
	^ self gtExampleViewColorBars: self gtExamplesTvTestColors
]

{ #category : #'*GToolkit-Examples-Extensions' }
Color class >> gtExampleViewColorBars: colors [
	| container |
	container := BlElement new 
		id: #colorBars;
		layout: BlLinearLayout horizontal;
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ].
	colors do: [ :color |
		container addChild: 
			(BrButton new
				background: color;
				action: [ :button | button phlow spawnObject: color ];
				constraintsDo: [ :c | 
					c horizontal matchParent.
					c vertical matchParent ]) ].
	^ container
]

{ #category : #'*GToolkit-Examples-Extensions' }
Color class >> gtExamplesTvTestColors [
	<gtExample>
	
	^ #('FFFFFF' 'FFFF01' '01FFFF' '00FF01' 'FF00FE' 'FF0700' '0000FE' '000000') 
			collect: [ :each | Color fromHexString: each ]
]
