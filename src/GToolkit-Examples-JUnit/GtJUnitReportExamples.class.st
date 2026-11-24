Class {
	#name : #GtJUnitReportExamples,
	#superclass : #Object,
	#category : #'GToolkit-Examples-JUnit-Examples'
}

{ #category : #examples }
GtJUnitReportExamples >> emptyReport [
	<gtExample>
	| report |
	report := GtJUnitReport fromString: '<testsuites/>'.
	self assert: report totalCount equals: 0.
	self assert: report unsuccessfulTestCases isEmpty.
	^ report
]

{ #category : #examples }
GtJUnitReportExamples >> invalidRoot [
	<gtExample>
	| rejected |
	rejected := false.
	[ GtJUnitReport fromString: '<other/>' ]
		on: Error
		do: [ :error | rejected := true ].
	self assert: rejected.
	^ rejected
]

{ #category : #examples }
GtJUnitReportExamples >> mixedResults [
	<gtExample>
	| report cases |
	report := GtJUnitReport
			fromString: '<testsuite name="Examples" tests="4" time="1.25"><properties><property name="os" value="macOS"/></properties><testcase classname="SomeExamples class" name="passing"/><testcase classname="SomeExamples" name="failing" time="0.25"><failure type="AssertionFailure" message="Expected &lt;value&gt;"><![CDATA[stack <frame>]]></failure><system-out>output</system-out></testcase><testcase name="error"><error message="boom">trace</error></testcase><testcase name="skip"><skipped message="Not supported"/></testcase><system-err>stderr</system-err></testsuite>'.
	cases := report allTestCases.
	self assert: report totalCount equals: 4.
	self assert: report passingCount equals: 1.
	self assert: report failureCount equals: 1.
	self assert: report errorCount equals: 1.
	self assert: report skippedCount equals: 1.
	self assert: cases first className equals: 'SomeExamples class'.
	self assert: cases first time isNil.
	self assert: cases second time equals: 0.25.
	self assert: cases second problems first message equals: 'Expected <value>'.
	self assert: cases second problems first type equals: 'AssertionFailure'.
	self assert: cases second problems first details equals: 'stack <frame>'.
	self assert: cases second systemOut equals: 'output'.
	self assert: report suites first systemErr equals: 'stderr'.
	self assert: (report suites first properties at: 'os') equals: 'macOS'.
	self assert: report suites first declaredTestCount equals: 4.
	self assert: report suites first time equals: 1.25.
	^ report
]

{ #category : #examples }
GtJUnitReportExamples >> multipleDiagnostics [
	<gtExample>
	| report testCase |
	report := GtJUnitReport
			fromString: '<testsuite><testcase name="mixed"><failure>one</failure><failure>two</failure><error>three</error><skipped/></testcase></testsuite>'.
	testCase := report allTestCases first.
	self assert: testCase problems size equals: 4.
	self assert: testCase status equals: #error.
	self assert: report unsuccessfulTestCases size equals: 1.
	^ testCase
]

{ #category : #examples }
GtJUnitReportExamples >> nestedSuites [
	<gtExample>
	| report |
	report := GtJUnitReport
			fromString: '<testsuites tests="99"><testsuite name="outer"><testcase name="direct"/><testsuite name="inner"><testcase name="nested"><skipped/></testcase></testsuite></testsuite><testsuite name="empty"/></testsuites>'.
	self assert: report suites size equals: 2.
	self assert: report totalCount equals: 2.
	self assert: report passingCount equals: 1.
	self assert: report skippedCount equals: 1.
	self assert: report suites first suites first name equals: 'inner'.
	self assert: report suites second declaredTestCount isNil.
	^ report
]
