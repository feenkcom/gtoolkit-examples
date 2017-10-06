private
methodUpdated: aCompiledMethod with: aResult
	MethodWidget methodsIconsCache 
		at: aCompiledMethod 
		ifPresent: [ :array | 
			array second labelGraphic: (self iconForMethod: aCompiledMethod result: aResult) ]