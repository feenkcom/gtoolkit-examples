testing
hash
	^ (self class hash 
		bitXor: self methodClass hash) 
			bitXor: self selector hash