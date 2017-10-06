baseline
baseline: spec
	<baseline>
	spec for: #common do: [ 
		spec
			package: 'GToolkit-Examples';
			package: 'GToolkit-Examples-UI' with: [ spec requires: #('GToolkit-Examples') ].
			
		spec 
			group: 'Core' with: #('GToolkit-Examples');
			group: 'default' with: #('GToolkit-Examples' 'GToolkit-Examples-UI')
	]
