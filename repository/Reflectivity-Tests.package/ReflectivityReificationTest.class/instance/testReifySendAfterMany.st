tests - sends
testReifySendAfterMany
	"test to reify a lot after"
	| sendNode instance executed |
	sendNode := (ReflectivityExamples >> #exampleMethod) ast body statements first value.
	executed := false.
		link := MetaLink new
		metaObject: [ :s :r :a :v | self assert: v equals: 5. executed := true ];
		selector: #value:value:value:value:;
		control: #after;
		arguments: #(selector receiver arguments value).
	sendNode link: link.
	self assert: sendNode hasMetalink.
	self assert: (ReflectivityExamples >> #exampleMethod) class equals: ReflectiveMethod.
	instance := ReflectivityExamples new.
	self assert: instance exampleMethod equals: 5.
	self assert: executed.