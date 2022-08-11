Class {
	#name : #FBFlowMapBuilder,
	#superclass : #RSAbstractContainerBuilder,
	#instVars : [
		'nodes'
	],
	#category : #'FingerBoard-Roassal'
}

{ #category : #accessing }
FBFlowMapBuilder >> nodes [

	^ nodes
]

{ #category : #accessing }
FBFlowMapBuilder >> nodes: anObject [

	nodes := anObject
]

{ #category : #hooks }
FBFlowMapBuilder >> renderIn: canvas [

	nodes do: [ :each | 
		canvas add: (each asRoassalShape @ RSDraggable @ RSPopup ) ].
		
	RSEdgeBuilder arrowedLine
		canvas: canvas;
		objects: nodes; 
		withBorderAttachPoint;
		connectFrom: #yourself 
		toAll: [ :e |
			e outgoing collect: #target ].
	

	RSHorizontalTreeLayout on: canvas nodes.
	canvas @ RSCanvasController.

]
