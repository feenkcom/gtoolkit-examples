activation
fullBrowserMenuPackageContextActivation
	<classAnnotation>
	^ CmdContextMenuCommandActivation
		byItemOf: GtExampleCalypsoMenuGroup
		order: self menuItemOrder
		for: ClyPackageContextOfFullBrowser