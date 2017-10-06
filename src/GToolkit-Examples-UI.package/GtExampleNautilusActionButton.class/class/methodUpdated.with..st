private
methodUpdated: aCompiledMethod with: aResult
	MethodWidget methodsIconsCache 
		at: aCompiledMethod 
		ifPresent: [ :holder | 
			holder labelGraphic: (self iconForMethod: aCompiledMethod result: aResult) ]