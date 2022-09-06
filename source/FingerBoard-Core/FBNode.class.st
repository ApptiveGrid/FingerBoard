Class {
	#name : #FBNode,
	#superclass : #Object,
	#instVars : [
		'incoming',
		'outgoing',
		'name',
		'id',
		'flow'
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

{ #category : #'as yet unclassified' }
FBNode >> evaluateIn: aFBActivation [
	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
FBNode >> executeIn: aFBActivation [ 
	self prepareIn: aFBActivation.
	self evaluateIn: aFBActivation.
	self postProcessIn: aFBActivation 
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
	id := UUID new asString36.
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
FBNode >> postProcessIn: aFBActivation [ 
	aFBActivation done
]

{ #category : #'as yet unclassified' }
FBNode >> prepareIn: aFBActivation [
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
