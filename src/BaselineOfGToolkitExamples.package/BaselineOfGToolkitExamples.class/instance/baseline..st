baseline
baseline: spec
	<baseline>
	spec for: #common do: [ 
		spec baseline: 'GToolkitExamplesEngine' with: [ spec 
				repository: 'github://feenkcom/gtoolkit-examples/src' ].
		spec
			package: 'GToolkit-Examples-Dummies' with: [ spec requires: #('GToolkitExamplesEngine') ];
			package: 'GToolkit-Examples-Roassal2UI' with: [ spec requires: #('GToolkitExamplesEngine') ];
			package: 'GToolkit-Examples-Extensions' with: [ spec requires: #('GToolkitExamplesEngine') ];
			package: 'GToolkit-Examples-Calypso' with: [ spec requires: #('GToolkitExamplesEngine') ];
			package: 'GToolkit-Tests-Examples' with: [ spec requires: #('GToolkitExamplesEngine'  'GToolkit-Examples-Extensions' 'GToolkit-Examples-Dummies') ].
			
		spec 
			group: 'Core' with: #('GToolkitExamplesEngine'  'GToolkit-Examples-Extensions');
			group: 'Tests' with: #('GToolkitExamplesEngine' 'GToolkit-Examples-Dummies' 'GToolkit-Tests-Examples');
			group: 'Calypso' with: #( 'default' 'GToolkit-Examples-Calypso' );
			group: 'default' with: #('GToolkitExamplesEngine' 'GToolkit-Examples-Extensions' 'GToolkit-Examples-Dummies' 'GToolkit-Tests-Examples' 'GToolkit-Examples-Roassal2UI').
	]
