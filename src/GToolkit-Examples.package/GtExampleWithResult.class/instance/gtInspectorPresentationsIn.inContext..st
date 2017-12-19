ui
gtInspectorPresentationsIn: composite inContext: aGTInspector
	"we collect all presentations from the wrapped example"
	super gtInspectorPresentationsIn: composite inContext: aGTInspector.
	self example gtInspectorPresentationsIn: composite inContext: aGTInspector