private
browseAfter: aCollection builder: aBuilder
	aCollection do: [ :after | 
		after forNautilus: [ :title :action | 
			(lastItem := aBuilder item: title)
				parent: #gte;
				action: [ action value ] ] ]