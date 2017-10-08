private
basicProcess: anExample
	self action ifNotNil: [ self example == anExample ifFalse: [ self action value: anExample ] ].