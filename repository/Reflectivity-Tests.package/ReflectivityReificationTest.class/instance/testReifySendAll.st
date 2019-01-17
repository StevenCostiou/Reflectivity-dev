tests - sends
testReifySendAll
	| sendNode instance |
	sendNode := (ReflectivityExamples >> #exampleMethod) ast body statements first value.
	link := MetaLink new
		metaObject: #receiver;
		selector: #perform:withArguments:;
		arguments: #(selector arguments).
	sendNode link: link.
	self assert: sendNode hasMetalink.
	self assert: (ReflectivityExamples >> #exampleMethod) class equals: ReflectiveMethod.
	instance := ReflectivityExamples new.
	self assert: instance exampleMethod equals: 5