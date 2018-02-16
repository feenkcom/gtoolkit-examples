activation
fullBrowserMenuMethodContextActivation
	<classAnnotation>
	^ CmdContextMenuCommandActivation
		byItemOf: GtExampleCalypsoMenuGroup
		order: self menuItemOrder
		for: ClyMethodContextOfFullBrowser