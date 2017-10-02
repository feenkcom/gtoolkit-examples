private
package: package matchesPackagePattern: packageName
	^ package packageName = packageName
		or: [ (packageName match: package packageName) 
			or: [ [ package packageName matchesRegexIgnoringCase: packageName ] 
						on: Error 
						do: [ false ] ] ]