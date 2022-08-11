Class {
	#name : #FBNode,
	#superclass : #Object,
	#instVars : [
		'incoming',
		'outgoing'
	],
	#category : #'FingerBoard-Core'
}

{ #category : #connecting }
FBNode >> addIncoming: aFBTransition [ 
	incoming add: aFBTransition.
]

{ #category : #connecting }
FBNode >> addOutgoing: aFBTransition [ 
	outgoing add: aFBTransition.
	aFBTransition target addIncoming: aFBTransition 
]

{ #category : #connecting }
FBNode >> addOutgoingNode: aFBNode [ 
	self addOutgoing: (FBTransition source: self target: aFBNode).
	^ aFBNode 
]

{ #category : #'as yet unclassified' }
FBNode >> executeIn: aFBFlowExecutor [ 
	self subclassResponsibility  
]

{ #category : #'as yet unclassified' }
FBNode >> findEnd [
	(self isKindOf: FBEndEvent) ifTrue: [ ^ self ]. 
	outgoing do: [ :transition |
		(transition target findEnd ifNotNil: [:end | ^ end ]) ].
	^ nil
]

{ #category : #testing }
FBNode >> hasOutgoing [ 
	^ outgoing notEmpty
]

{ #category : #initialization }
FBNode >> initialize [ 
	super initialize.
	incoming := OrderedCollection new.
	outgoing := OrderedCollection new
]

{ #category : #'as yet unclassified' }
FBNode >> inspectionFlow [
	<inspectorPresentationOrder: 0 title: 'flow'>
	^ SpRoassal3InspectorPresenter  new 
		canvas: (FBFlowMapBuilder new 
			nodes: self neighbourNodes;
			build )
		yourself
]

{ #category : #'as yet unclassified' }
FBNode >> neighbourNodes [
	^ ((incoming collect: #source), (outgoing collect: #target)) add: self; yourself
]

{ #category : #accessing }
FBNode >> outgoing [
	^ outgoing
]
