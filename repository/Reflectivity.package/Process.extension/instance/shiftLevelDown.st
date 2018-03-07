*Reflectivity
shiftLevelDown
	<metaLinkOptions: #( + optionDisabledLink)>
	level ifNil: [ level := 0 ].
	(level rfIsEqual: 0) ifTrue: [ ^level ].
	(level rfIsEqual: 1) ifTrue: [ ^level := 0 ].
	level := level rfMinus: 1.