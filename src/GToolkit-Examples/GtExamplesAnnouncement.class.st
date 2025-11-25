Class {
	#name : #GtExamplesAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'group'
	],
	#category : 'GToolkit-Examples-Announcements'
}

{ #category : #accessing }
GtExamplesAnnouncement >> group [
	<return: #GtExampleGroup>
	^ group
]

{ #category : #accessing }
GtExamplesAnnouncement >> group: aGtExampleGroup [
	self 
		assert: [ aGtExampleGroup isNotNil ]
		description: [ 'Example group must be non-nil' ].
	group := aGtExampleGroup
]
