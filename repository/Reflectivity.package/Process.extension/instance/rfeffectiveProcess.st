*Reflectivity
rfeffectiveProcess
	"same as #effectiveProcess but for internal use for metalink activation"
	<metaLinkOptions: #( + optionDisabledLink)>
	^effectiveProcess ifNil: [self] 