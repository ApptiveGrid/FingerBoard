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
		(activations anySatisfy: [ :activation | activation node = each ]) ifTrue: [ 
			shape border: (RSBorder new width: 2; color: (Color red alpha: 0.5)) ].
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
