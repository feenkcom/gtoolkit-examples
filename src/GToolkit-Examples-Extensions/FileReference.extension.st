Extension { #name : #FileReference }

{ #category : #'*GToolkit-Examples-Extensions' }
FileReference class >> gtExampleDirectory [
	<gtExample>
	| directory subDirectory |
	directory := FileSystem memory workingDirectory / 'directory'.
	directory createDirectory.
	directory / 'file1.txt' writeStreamDo: [ :stream | stream nextPutAll: 'File1 contents' ].
	directory / 'file2.txt' writeStreamDo: [ :stream | stream nextPutAll: 'File2 contents' ].
	subDirectory := (directory / 'subdirectory') createDirectory.
	subDirectory / 'file3.txt' writeStreamDo: [ :stream | stream nextPutAll: 'File3 contents' ].
	^ directory
]

{ #category : #'*GToolkit-Examples-Extensions' }
FileReference class >> gtExampleGif [
	<gtExample>
	^ (FileSystem memory workingDirectory / 'pharoicon.gif')
		writeStreamDo: [ :stream | 
			GIFReadWriter
				putForm: (Smalltalk ui icons iconNamed: #pharoIcon)
				onStream: stream ];
		yourself
]

{ #category : #'*GToolkit-Examples-Extensions' }
FileReference class >> gtExamplePng [
	<gtExample>
	^ (FileSystem memory workingDirectory / 'pharoicon.png')
		writeStreamDo: [ :stream | 
			PNGReadWriter
				putForm: (Smalltalk ui icons iconNamed: #pharoIcon)
				onStream: stream ];
		yourself
]

{ #category : #'*GToolkit-Examples-Extensions' }
FileReference class >> gtExampleText [
	<gtExample>
	^ FileSystem memory workingDirectory / 'sample.txt' 
		writeStreamDo: [ :stream |
			stream nextPutAll: self comment ];
		yourself
]
