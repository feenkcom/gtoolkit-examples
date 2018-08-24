Extension { #name : #Announcer }

{ #category : #'*GToolkit-Examples-Extensions' }
Announcer class >> gtExampleEmptyAnnouncer [
	<gtExample>
	<label: 'Empty Announcer'>
	
	^ self new
]

{ #category : #'*GToolkit-Examples-Extensions' }
Announcer class >> gtExampleSystemAnnouncer [
	<gtExample>
	<label: 'System Announcer'>
	
	^ SystemAnnouncer uniqueInstance
]
