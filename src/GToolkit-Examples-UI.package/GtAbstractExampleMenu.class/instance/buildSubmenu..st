private
buildSubmenu: aBuilder
	(lastItem := aBuilder item: #gte)
		order: self submenuOrder;
		label: 'GToolkit Examples';
		withSeparatorAfter.