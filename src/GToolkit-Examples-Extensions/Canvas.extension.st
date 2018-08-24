Extension { #name : #Canvas }

{ #category : #'*GToolkit-Examples-Extensions' }
Canvas class >> gtExampleNullCanvas [
	<gtExample>
	<label: 'Canvas: Null'>
	
	^ NullCanvas new
]

{ #category : #'*GToolkit-Examples-Extensions' }
Canvas class >> gtExampleWorldCanvas [
	<gtExample>
	<label: 'Canvas: World'>
	
	^ Canvas new
]

{ #category : #'*GToolkit-Examples-Extensions' }
Canvas class >> gtExampleWorldCanvasWithAlpha [
	<gtExample>
	<label: 'Canvas: World+ALpha'>
	
	^ (AlphaBlendingCanvas on: Canvas new)	
		alpha: 0.3
]

{ #category : #'*GToolkit-Examples-Extensions' }
Canvas class >> gtExampleWorldCanvasWithShadow [
	<gtExample>
	<label: 'Canvas: World+Shadow'>
	
	^ (ShadowDrawingCanvas on: Canvas new)
		shadowColor: (Color black alpha: 0.5)
]
