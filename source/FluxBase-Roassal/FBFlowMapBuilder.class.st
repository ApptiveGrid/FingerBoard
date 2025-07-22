Class {
	#name : 'FBFlowMapBuilder',
	#superclass : 'RSAbstractContainerBuilder',
	#instVars : [
		'nodes',
		'activations'
	],
	#category : 'FluxBase-Roassal',
	#package : 'FluxBase-Roassal'
}

{ #category : 'accessing' }
FBFlowMapBuilder >> activations [

	^ activations ifNil: [ activations := OrderedCollection new ]
]

{ #category : 'accessing' }
FBFlowMapBuilder >> activations: aCollection [ 
	activations := aCollection 
]

{ #category : 'accessing' }
FBFlowMapBuilder >> nodes [

	^ nodes
]

{ #category : 'accessing' }
FBFlowMapBuilder >> nodes: anObject [

	nodes := anObject
]

{ #category : 'hooks' }
FBFlowMapBuilder >> renderIn: canvas [

	nodes do: [ :each | | shape |
		shape := each asRoassalShape @ RSDraggable @ RSPopup.
		self activations 
			detect: [ :activation | activation node = each ]
			ifFound: [ :activation | shape border: activation stateBorder ].
		each name 
			ifNotNil: [ shape ].
	canvas add: shape ] .
		
	RSEdgeBuilder arrowedLine
		canvas: canvas;
		objects: nodes; 
		withHorizontalAttachPoint;
		connectFrom: #yourself 
		toAll: [ :e |
			e outgoing collect: #target ].
	

	RSHorizontalTreeLayout on: canvas nodes.
	canvas @ RSCanvasController.

]
