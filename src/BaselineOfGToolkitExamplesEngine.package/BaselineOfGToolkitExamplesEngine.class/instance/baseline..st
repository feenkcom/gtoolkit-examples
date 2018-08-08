baseline
baseline: spec
	<baseline>
	spec for: #common do: [ 
		spec
			package: 'GToolkit-Examples';
			package: 'GToolkit-Examples-UI' with: [ spec requires: #('GToolkit-Examples') ].			
	].
	spec for: #'pharo6.x' do: [ 
		spec
			package: 'GToolkit-Examples-UI-Nautilus'.			
	]