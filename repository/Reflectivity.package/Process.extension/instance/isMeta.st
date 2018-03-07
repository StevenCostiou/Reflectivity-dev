*Reflectivity
isMeta
	<metaLinkOptions: #( + optionDisabledLink)>
	level ifNil: [ level := 0 ].
	^level ~= 0