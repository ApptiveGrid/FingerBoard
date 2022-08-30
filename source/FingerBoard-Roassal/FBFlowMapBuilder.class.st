Class {
	#name : #FBFlowMapBuilder,
	#superclass : #RSAbstractContainerBuilder,
	#instVars : [
		'nodes',
		'activations'
	],
	#category : #'FingerBoard-Roassal'
}

{ #category : #accessing }
FBFlowMapBuilder >> activations [

	^ activations ifNil: [ activations := OrderedCollection new ]
]

{ #category : #accessing }
FBFlowMapBuilder >> activations: aCollection [ 
	activations := aCollection 
]

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

	nodes do: [ :each | | shape |
		shape := each asRoassalShape @ RSDraggable @ RSPopup.
		self activations 
			detect: [ :activation | activation node = each ]
			ifFound: [ :activation | shape border: activation stateBorder ].
		each name 
			ifNotNil: [ shape @ (RSLabeled new text: each name; middle; fontSize: 6; lowColor: Color black ) ].
	canvas add: shape ] .
		
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
