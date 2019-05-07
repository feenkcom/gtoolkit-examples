Class {
	#name : #GtExampleExecuted,
	#superclass : #GtExampleAnnouncement,
	#category : #'GToolkit-Examples-Announcements'
}

{ #category : #accessing }
GtExampleExecuted >> result [
	<return: #GtExampleResult>
	^ self example result
]
