Class {
	#name : #GtExampleAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'example'
	],
	#category : #'GToolkit-Examples-Announcements'
}

{ #category : #accessing }
GtExampleAnnouncement >> example [
	<return: #GtExample>
	^ example
]

{ #category : #accessing }
GtExampleAnnouncement >> example: aGtExample [
	self 
		assert: [ aGtExample isNotNil ] 
		description: [ 'Example must be non-nil' ].
	example := aGtExample
]
