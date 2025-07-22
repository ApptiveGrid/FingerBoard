Extension { #name : 'FBFlow' }

{ #category : '*FluxBase-Roassal' }
FBFlow >> inspectionFlow [
	<inspectorPresentationOrder: 0 title: 'flow'>
	^ SpRoassal3InspectorPresenter  new 
		canvas: (FBFlowMapBuilder new 
			nodes: self nodes;
			build )
		yourself
]
