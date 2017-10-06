*GToolkit-Examples-Core
isGTReservedMethod
	^ #( gtExamplesSubjects gtExamplesFactory gtExample gtExamples ) 
			anySatisfy: [ :selector | selector = self selector ]