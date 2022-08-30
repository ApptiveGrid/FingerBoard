Extension { #name : #FBFlow }

{ #category : #'*FingerBoard-Roassal' }
FBFlow >> inspectionFlow [
	<inspectorPresentationOrder: 0 title: 'flow'>
	^ SpRoassal3InspectorPresenter  new 
		canvas: (FBFlowMapBuilder new 
			nodes: self allNodes;
			build )
		yourself
]
