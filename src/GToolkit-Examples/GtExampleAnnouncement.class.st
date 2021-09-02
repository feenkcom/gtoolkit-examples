Class {
	#name : 'GtExampleAnnouncement',
	#superclass : 'Announcement',
	#instVars : [
		'example'
	],
	#category : 'GToolkit-Examples-Announcements'
}

{ #category : 'accessing' }
GtExampleAnnouncement >> example [
	<return: #GtExampleWithResult>
	^ example
]

{ #category : 'accessing' }
GtExampleAnnouncement >> example: aGtExampleWithResult [
	self 
		assert: [ aGtExampleWithResult isNotNil ] 
		description: [ 'Example must be non-nil' ].
	example := aGtExampleWithResult
]

{ #category : 'testing' }
GtExampleAnnouncement >> hasResult [
	<return: #Boolean>
	^ self example hasResult
]

{ #category : 'accessing' }
GtExampleAnnouncement >> returnValue [
	^ self example returnValue
]
