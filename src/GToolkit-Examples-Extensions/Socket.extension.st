Extension { #name : #Socket }

{ #category : #'*GToolkit-Examples-Extensions' }
Socket class >> gtExampleTCPSocket [
	<gtExample>
	<label: 'TCP Socket'>
	
	^ Socket newTCP
]

{ #category : #'*GToolkit-Examples-Extensions' }
Socket class >> gtExampleUDPSocket [
	<gtExample>
	<label: 'UDP Socket'>
	
	^ Socket newUDP
]
