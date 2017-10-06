baseline
baseline: spec
	<baseline>
	spec for: #common do: [ 
		spec
			package: 'GToolkit-Examples';
			package: 'GToolkit-Examples-Dummies' with: [ spec requires: #('GToolkit-Examples') ];
			package: 'GToolkit-Examples-UI' with: [ spec requires: #('GToolkit-Examples') ];
			package: 'GToolkit-Examples-Roassal2UI' with: [ spec requires: #('GToolkit-Examples-UI') ];
			package: 'GToolkit-Examples-Extensions' with: [ spec requires: #('GToolkit-Examples') ];
			package: 'GToolkit-Tests-Examples' with: [ spec requires: #('GToolkit-Examples'  'GToolkit-Examples-Extensions' 'GToolkit-Examples-UI' 'GToolkit-Examples-Roassal2UI'  'GToolkit-Examples-Dummies') ].
			
		spec 
			group: 'Core' with: #('GToolkit-Examples' );
			group: 'default' with: #('GToolkit-Examples' 'GToolkit-Examples-Extensions' 'GToolkit-Examples-UI' 'GToolkit-Tests-Examples' #'GToolkit-Examples-Dummies' #'GToolkit-Examples-Roassal2' ).
	]
