private
browseSubjects: aCollection builder: aBuilder
	" this is yet too complicated - SIMPLIFY term and behavior for the user
	
	aCollection do: [ :subject | 
		subject forNautilus: [ :title :action | 			
			(lastItem := aBuilder item: title)
				parent: #gte;
				action: [ action value ] ] ]
	"