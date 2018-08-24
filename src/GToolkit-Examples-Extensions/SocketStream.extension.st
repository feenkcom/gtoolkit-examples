Extension { #name : #SocketStream }

{ #category : #'*GToolkit-Examples-Extensions' }
SocketStream class >> gtExampleOnTCPSocket [
	<gtExample>
	<label: 'Stream on TCP socket'>
	
	^ SocketStream on: Socket newTCP
]

{ #category : #'*GToolkit-Examples-Extensions' }
SocketStream class >> gtExampleOnUDPSocket [
	<gtExample>
	<label: 'Stream on UDP socket'>
	
	^ SocketStream on: Socket newUDP
]
