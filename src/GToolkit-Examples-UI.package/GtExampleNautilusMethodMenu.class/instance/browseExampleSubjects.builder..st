private
browseExampleSubjects: aCollection builder: aBuilder
	" this is yet too complicated - SIMPLIFY term and behavior for the user
	
	(lastItem := aBuilder item: #'Browse subjects')
		parent: #gte;
		action: [ GTExampleNavigation browseAllExampleSubjects: aCollection ];
		icon: Smalltalk ui icons glamorousDiveRight
	"