private
browseExamplesWithSubject: aLiteral builder: aBuilder
	" this is yet too complicated - SIMPLIFY term and behavior for the user
	
	(lastItem := aBuilder item: 'Browse examples with subject ""' ,  aLiteral gtDisplayString , '""')
		parent: #gte;
		action: [ GTExampleNavigation browseExamplesWithSubject: aLiteral ]
	"