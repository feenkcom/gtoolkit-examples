activation
fullBrowserMenuClassContextActivation
	<classAnnotation>
	^ CmdContextMenuCommandActivation
		byItemOf: GtExampleCalypsoMenuGroup
		order: self menuItemOrder
		for: ClyClassContextOfFullBrowser