private
includesPackages: includedPackageNames excludedPackages: excludedPackageNames
	| packages |
	packages := OrderedCollection new.
	(RPackageOrganizer default packages 
		sorted: [ :a :b | a packageName < b packageName ]) 
		do: [ :package |
			((includedPackageNames isEmptyOrNil
				or: [ includedPackageNames anySatisfy: [ :packageName | package packageName asLowercase beginsWith: packageName asLowercase ] ])
					and: [ excludedPackageNames isEmptyOrNil
						or: [ excludedPackageNames noneSatisfy: [ :packageName | package packageName asLowercase beginsWith: packageName asLowercase ] ] ])
							ifTrue: [ packages add: package ] ].
	^ packages