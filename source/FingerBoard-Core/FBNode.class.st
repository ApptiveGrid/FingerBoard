Class {
	#name : #FBNode,
	#superclass : #Object,
	#instVars : [
		'id',
		'name',
		'flow',
		'incoming',
		'outgoing',
		'behaviorClass'
	],
	#category : #'FingerBoard-Core'
}

{ #category : #testing }
FBNode class >> isAbstract [

	^ true
]

{ #category : #'instance creation' }
FBNode class >> named: aString [ 
	^ self new 
		name: aString
]

{ #category : #associating }
FBNode >> --> aNode [ 
	^ aNode addTo: self.

]

{ #category : #'instance creation' }
FBNode >> activateWith: anFBActivation [ 
	^ self behaviorClass new
		activation: anFBActivation;
		execute	
]

{ #category : #connecting }
FBNode >> addIncoming: aFBTransition [ 
	incoming add: aFBTransition.
	"nodes can be connected in multiple ways not necessarily early connected
	to the start node. So we try to propagate the flow whenever there is a 
	new transition"
	(flow isNil and: [ aFBTransition source flow notNil ])
		ifTrue: [ 
			self flow: aFBTransition source flow ] 
]

{ #category : #connecting }
FBNode >> addOutgoing: aFBTransition [ 
	outgoing add: aFBTransition.
	aFBTransition target addIncoming: aFBTransition.
	"nodes can be connected in multiple ways not necessarily early connected
	to the start node. So we try to propagate the flow whenever there is a 
	new transition"

	(flow isNil and: [ aFBTransition target flow notNil ])
		ifTrue: [ 
			self flow: aFBTransition target flow ] 
]

{ #category : #connecting }
FBNode >> addOutgoingNode: aFBNode [ 
	self addOutgoing: (FBTransition source: self target: aFBNode).
	^ aFBNode 
]

{ #category : #adding }
FBNode >> addTo: aFBNode [
	aFBNode addOutgoingNode: self.
	^ self
]

{ #category : #converting }
FBNode >> asRoassalShape [
	^ RSLabel new text: 'N/A'
]

{ #category : #accessing }
FBNode >> behaviorClass [

	^ behaviorClass ifNil: [ 
		behaviorClass := self defaultBehaviorClass ]
]

{ #category : #accessing }
FBNode >> behaviorClass: anObject [

	behaviorClass := anObject
]

{ #category : #accessing }
FBNode >> defaultBehaviorClass [
	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
FBNode >> detach [
	incoming copy do: #detach.
	outgoing copy do: #detach.
]

{ #category : #'as yet unclassified' }
FBNode >> findEnd [
	(self isKindOf: FBEndEvent) ifTrue: [ ^ self ]. 
	outgoing do: [ :transition |
		(transition target findEnd ifNotNil: [:end | ^ end ]) ].
	^ nil
]

{ #category : #accessing }
FBNode >> flow [
	^ flow 
]

{ #category : #initialization }
FBNode >> flow: aFBFlow [ 
	flow ifNil: [.
		aFBFlow addNode: self ].
	self propagateFlow 

]

{ #category : #testing }
FBNode >> hasOutgoing [ 
	^ outgoing notEmpty
]

{ #category : #accessing }
FBNode >> id [
	^ id
]

{ #category : #accessing }
FBNode >> incoming [

	^ incoming
]

{ #category : #accessing }
FBNode >> incomingNodes [

	^ incoming collect: #source
]

{ #category : #initialization }
FBNode >> initialize [ 
	super initialize.
	id := FBIdGenerator current newId.
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

{ #category : #accessing }
FBNode >> lastValueIn: aFBFlowExecutor [ 
	^ aFBFlowExecutor lastValueOf: self
]

{ #category : #accessing }
FBNode >> name [
	^ name
]

{ #category : #accessing }
FBNode >> name: aString [ 
	name := aString
]

{ #category : #'as yet unclassified' }
FBNode >> neighbourNodes [
	^ ((incoming collect: #source), (outgoing collect: #target)) add: self; yourself
]

{ #category : #accessing }
FBNode >> outgoing [
	^ outgoing
]

{ #category : #accessing }
FBNode >> outgoingNodes [

	^ outgoing collect: #target
]

{ #category : #'as yet unclassified' }
FBNode >> propagateFlow [
	"try setting the flow in the neighbor nodes. This can bubble
	up and down to be sure every node has a flow set"
	incoming do: [ :each |
		each source flow isNil ifTrue: [
			each source flow: flow.
			each source propagateFlow ] ].
	outgoing do: [ :each |
		each target flow isNil ifTrue: [
			each target flow: flow.
			each target propagateFlow ] ]
]

{ #category : #removing }
FBNode >> remove [ 
	self detach.
	flow basicRemoveNode: self.
]

{ #category : #removing }
FBNode >> removeIncoming: aFBTransition [ 
	incoming remove: aFBTransition 
]

{ #category : #removing }
FBNode >> removeOutgoing: aFBTransition [ 
	outgoing remove: aFBTransition 
]

{ #category : #initialization }
FBNode >> setFlow: aFlow [ 
	flow := aFlow
]

{ #category : #'as yet unclassified' }
FBNode >> when: aBlock [ 
	^ FBConditionalTransition new 
		target: self;
		condition: aBlock
]
