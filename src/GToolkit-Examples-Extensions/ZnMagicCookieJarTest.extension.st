Extension { #name : #ZnMagicCookieJarTest }

{ #category : #'*Gtoolkit-Examples-Extensions' }
ZnMagicCookieJarTest >> example [
	<gtExample>
	| jar c1 c2  |
	jar := ZnCookieJar new.
	c1 := ZnCookie fromString: self cookieString for: 'https://www.google.com' asZnUrl.
	c2 := ZnCookie fromString: self cookieStringAlt for: 'https://www.pharo-project.org' asZnUrl.
	c2 secure: true.
	jar
		add: c1;
		add: c2.
	^ jar
]
