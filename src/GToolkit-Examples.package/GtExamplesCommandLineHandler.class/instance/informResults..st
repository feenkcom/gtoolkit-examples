private
informResults: results
	self stdout 
		<< ('{1} run, {2} passes, {3} failures, {4} errors.'
			format: {
				results sum: #examplesTotal.
				results sum: #examplesPassing.
				results sum: #examplesFailures.
				results sum: #examplesErrors })
		<< OSPlatform current lineEnding