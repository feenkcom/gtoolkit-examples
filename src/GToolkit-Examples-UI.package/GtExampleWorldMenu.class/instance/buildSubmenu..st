private
buildSubmenu: aBuilder
	(lastItem := aBuilder item: #gte)
		order: 0.15;
		parent: 'Tools';
		label: 'GToolkit Examples';
		withSeparatorAfter.