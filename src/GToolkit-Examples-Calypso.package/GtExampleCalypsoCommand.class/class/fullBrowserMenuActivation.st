activation
fullBrowserMenuActivation
	<classAnnotation>
	^ CmdContextMenuCommandActivation
		byItemOf: GtExampleCalypsoMenuGroup
		order: self menuItemOrder
		for: self contextClass