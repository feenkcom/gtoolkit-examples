testing
hash
	^ (self class hash 
		bitXor: self methodClassName hash)
			bitXor: self selector hash