Extension { #name : 'FBFlow' }

{ #category : '*FluxBase-Roassal' }
FBFlow >> inspectionFlow: aBuilder [
	<inspectorPresentationOrder: 0 title: 'flow'>
	^ aBuilder newRoassal 
		canvas: (FBFlowMapBuilder new 
			nodes: self nodes;
			build )
		yourself
]
