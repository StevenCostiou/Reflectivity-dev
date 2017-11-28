permalinks
installPermaLink: aPermaLink onTempVarNamed: aTempName inMethod: aMethodName
	| temp |
	temp := MetalinkTargetResolver lookupTemporaryNamed: aTempName inMethod: aMethodName for: aPermaLink targetObjectOrClass.

	aPermaLink slotOrVariable: temp.
	aPermaLink slotOrVarMethod: temp method.
	
	self registerAndInstallPermaLink: aPermaLink forTarget: temp
	


