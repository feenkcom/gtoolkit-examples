Class {
	#name : #GtExampleExecuted,
	#superclass : #GtExampleAnnouncement,
	#instVars : [
		'result'
	],
	#category : #'GToolkit-Examples-Announcements'
}

{ #category : #accessing }
GtExampleExecuted >> result [
	<return: #GtExampleResult>
	^ result
]

{ #category : #accessing }
GtExampleExecuted >> result: aGtExampleResult [
	self 
		assert: [ aGtExampleResult isNotNil ] 
		description: [ 'Example result must be non-nil' ].
	result := aGtExampleResult
]
