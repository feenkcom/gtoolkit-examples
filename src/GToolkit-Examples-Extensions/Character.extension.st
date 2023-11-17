Extension { #name : #Character }

{ #category : #'*GToolkit-Examples-Extensions' }
Character class >> gtExampleA [
	"Unicode character U+0041 LATIN CAPITAL LETTER A"
	<gtExample>
	^ $A
]

{ #category : #'*GToolkit-Examples-Extensions' }
Character class >> gtExampleAngstrom [
	"Unicode character U+00C5 LATIN CAPITAL LETTER A WITH RING ABOVE"
	<gtExample>
	^ 16rC5 asCharacter
]

{ #category : #'*GToolkit-Examples-Extensions' }
Character class >> gtExampleApple [
	"Unicode character U+F8FF Apple logo (private use, non standard)"
	<gtExample>
	^ 16rF8FF asCharacter
]

{ #category : #'*GToolkit-Examples-Extensions' }
Character class >> gtExampleSpace [
	"Unicode character U+0020 SPACE" 
	<gtExample>
	^ self space
]

{ #category : #'*GToolkit-Examples-Extensions' }
Character class >> gtExampleStar [
	"Unicode character U+2605 BLACK STAR"
	<gtExample>
	^ 16r2605 asCharacter
]
