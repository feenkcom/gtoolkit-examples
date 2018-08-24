Class {
	#name : #GtDummyExamplesRecursive,
	#superclass : #GtAbstractDummyExamples,
	#category : 'GToolkit-Examples-Dummies-Data'
}

{ #category : #'examples 1' }
GtDummyExamplesRecursive class >> a [
	<gtExample>
	<label: 'Dummy #a, depends on #a'>
	<noTest>
	
	^ self a " loop "
]

{ #category : #'examples 1' }
GtDummyExamplesRecursive class >> b [
	<gtExample>
	<label: 'Dummy #b, depends on #a'>
	<noTest>
	
	^ self a
]

{ #category : #'examples 1' }
GtDummyExamplesRecursive class >> c [
	<gtExample>
	<label: 'Dummy #c, depends on #b'>
	<noTest>
	
	^ self b
]

{ #category : #'examples 2' }
GtDummyExamplesRecursive class >> d [
	<gtExample>
	<label: 'Dummy #d, depends on #f'>
	<noTest>
	
	^ self f " loop "
]

{ #category : #'examples 2' }
GtDummyExamplesRecursive class >> e [
	<gtExample>
	<label: 'Dummy #e, depends on #d'>
	<noTest>
	
	^ self d
]

{ #category : #'examples 2' }
GtDummyExamplesRecursive class >> f [
	<gtExample>
	<label: 'Dummy #f, depends on #e'>
	<noTest>
	
	^ self e
]

{ #category : #'examples 3' }
GtDummyExamplesRecursive class >> g [
	<gtExample>
	<label: 'Dummy #g, depends on #i and #h'>
	<noTest>
	
	^ self i & self h
]

{ #category : #'examples 3' }
GtDummyExamplesRecursive class >> h [
	<gtExample>
	<label: 'Dummy #h, (the only successful example in this example provider)'>
	<noTest>
	
	^ true
]

{ #category : #'examples 3' }
GtDummyExamplesRecursive class >> i [
	<gtExample>
	<label: 'Dummy #i, depends on #j and #h'>
	<noTest>
	
	^ self j & self h
]

{ #category : #testing }
GtDummyExamplesRecursive class >> isExpectedRecursion [
	^ true
]

{ #category : #'examples 3' }
GtDummyExamplesRecursive class >> j [
	<gtExample>
	<label: 'Dummy #j, depends: #g'>
	<noTest>
	
	^ self g " loop "
]

{ #category : #'examples 4' }
GtDummyExamplesRecursive class >> k [
	<gtExample>
	<label: 'Dummy #k, depends on #m and #l'>
	<noTest>
	
	^ self l & self m
]

{ #category : #'examples 4' }
GtDummyExamplesRecursive class >> l [
	<gtExample>
	<label: 'Dummy #l, depends on #k and #n'>
	<noTest>
	
	^ self k " loop "
		& self n
]

{ #category : #'examples 4' }
GtDummyExamplesRecursive class >> m [
	<gtExample>
	<label: 'Dummy #m, depends on #l and #n'>
	<noTest>
	
	^ self l & self n
]

{ #category : #'examples 4' }
GtDummyExamplesRecursive class >> n [
	<gtExample>
	<label: 'Dummy #n, depends on #k'>
	<noTest>
	
	^ self k "loop"
]

{ #category : #'examples 5' }
GtDummyExamplesRecursive class >> o [
	<gtExample>
	<label: 'Dummy #o, depends on #p'>
	<noTest>
	
	^ self p
]

{ #category : #'examples 5' }
GtDummyExamplesRecursive class >> p [
	<gtExample>
	<label: 'Dummy #p, depends on #o'>
	<noTest>
	
	^ self o " loop " 
]

{ #category : #'examples 6' }
GtDummyExamplesRecursive class >> q [
	<gtExample>
	<label: 'Dummy #q, depends on #r and #r'>
	<noTest>
	
	^ self r | self r
]

{ #category : #'examples 6' }
GtDummyExamplesRecursive class >> r [
	<gtExample>
	<label: 'Dummy #r, depends on #s'>
	<noTest>
		
	^ self s
]

{ #category : #'examples 6' }
GtDummyExamplesRecursive class >> s [
	<gtExample>
	<label: 'Dummy #s, depends on #q'>
	<noTest>
		
	^ self q " loop " 
]

{ #category : #'examples 7' }
GtDummyExamplesRecursive class >> t [
	<gtExample>
	<label: 'Dummy #t, depends on #u and #v'>
	<noTest>
		
	^ self u & self v
]

{ #category : #'examples 7' }
GtDummyExamplesRecursive class >> u [
	<gtExample>
	<label: 'Dummy #u, depends on #v and #w'>
	<noTest>
	
	^ self w & self v
]

{ #category : #'examples 7' }
GtDummyExamplesRecursive class >> v [
	<gtExample>
	<label: 'Dummy #v, depends on #x'>
	<noTest>
		
	^ self x
]

{ #category : #'examples 7' }
GtDummyExamplesRecursive class >> w [
	<gtExample>
	<label: 'Dummy #w, depends on #x and #y'>
	<noTest>
		
	^ self x & self y
]

{ #category : #'examples 7' }
GtDummyExamplesRecursive class >> x [
	<gtExample>
	<label: 'Dummy #x, depends on #y'>
	<noTest>
	
	^ self y
]

{ #category : #'examples 7' }
GtDummyExamplesRecursive class >> y [
	<gtExample>
	<label: 'Dummy #y, depends on #z'>
	<noTest>
	
	^ self z
]

{ #category : #'examples 7' }
GtDummyExamplesRecursive class >> z [
	<gtExample>
	<label: 'Dummy #z, depends on #t'>
	<noTest>
	
	^ self t " loop "
]
