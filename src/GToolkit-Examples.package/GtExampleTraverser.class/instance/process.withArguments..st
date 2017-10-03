private
process: anExample withArguments: aBlock
	self action ifNotNil: [ self example == anExample ifFalse: [ self action value: anExample ] ].