*Reflectivity
shiftLevelUp
	<metaLinkOptions: #( + optionDisabledLink)>
	level ifNil: [ level := 0 ].
	level := level rfPlus: 1