Class {
	#name : #GtExamplesBasicHudsonReport,
	#superclass : #Object,
	#category : #'GToolkit-Examples-Testing'
}

{ #category : #converting }
GtExamplesBasicHudsonReport >> convert: aString [
	^ (aString asString 
		copyReplaceAll: (String with: Character cr with: Character lf) with: (String with: Character lf))
		copyReplaceAll: (String with: Character cr) with: (String with: Character lf)
]

{ #category : #converting }
GtExamplesBasicHudsonReport >> encode: aString [
	^ ((aString asString 
		copyReplaceAll: '&' with: '&amp;') 
		copyReplaceAll: '"' with: '&quot;') 
		copyReplaceAll: '<' with: '&lt;'
]
