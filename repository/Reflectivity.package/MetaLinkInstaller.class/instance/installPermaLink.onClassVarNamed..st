permalinks
installPermaLink: aPermaLink onClassVarNamed: aClassVarName
	| classVar |	
	classVar := MetalinkTargetResolver classVariableNamed: aClassVarName for: aPermaLink targetObjectOrClass.	
	aPermaLink slotOrVariable: classVar.
	
	self registerAndInstallPermaLink: aPermaLink forTarget: classVar