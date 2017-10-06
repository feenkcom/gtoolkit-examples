public
paint
	group := RTGroup new.
	edges := OrderedCollection new.
	fromTo := Dictionary new.
	nodes := Dictionary new.
	processing := Set new.
	self buildDependencies: self example at: nil parent: nil.
	self buildDependents: self example child: nil.
	view addAll: group @ (RTPopup text: [ :node | node gtDisplayString ]) @ RTDraggable.
	view addAll: edges.
	RTTreeLayout new on: group.
	view pushBackEdges.
	^ view