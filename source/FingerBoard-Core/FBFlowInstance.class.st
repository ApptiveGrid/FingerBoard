Class {
	#name : #FBFlowInstance,
	#superclass : #Object,
	#instVars : [
		'id',
		'flow',
		'executor',
		'announcer',
		'events'
	],
	#category : #'FingerBoard-Core-Model'
}

{ #category : #'as yet unclassified' }
FBFlowInstance >> aboutToTransition: aNode [
	"subclasses can overwrite this method to act before a transition
	is taken. This enables checks if a transition is possible before
	adding an activation for it"
]

{ #category : #convenience }
FBFlowInstance >> activate: anActivation [ 
	[ [ 
		self addEvent: (FBNodeActivationStarted new
			activation: anActivation).
		self processActivation: anActivation.
	  	self addEvent: (FBNodeActivationDone new
			activation: anActivation) ]
		on: FBError  
		do: [ :error |
			self handleActivationError: error activation: anActivation ] ]
		on: Error 
		do: [ :error | 
			self handleActivationError: error activation: anActivation.
			error pass ]
	
]

{ #category : #accessing }
FBFlowInstance >> activationClass [
	^ flow activationClass
]

{ #category : #accessing }
FBFlowInstance >> activationOfNode: aFBNode [
	^ self activations 
		detect: [ :each | each node = aFBNode ]
		ifNone: [ Error signal: 'no activation found for node' ]
]

{ #category : #accessing }
FBFlowInstance >> activations [
	^ self executor activations
]

{ #category : #events }
FBFlowInstance >> addEvent: aFBFlowEvent [

	self events add: (aFBFlowEvent
			 flowInstance: self;
			 yourself).
	self announce: aFBFlowEvent
]

{ #category : #announcements }
FBFlowInstance >> announce: aFBModelEvent [
	self announcer announce: aFBModelEvent 
]

{ #category : #accessing }
FBFlowInstance >> announcer [
	^ announcer ifNil: [ 
		announcer := Announcer new ]
]

{ #category : #accessing }
FBFlowInstance >> atEnd [
	^ executor atEnd
]

{ #category : #'as yet unclassified' }
FBFlowInstance >> basicActivate: anActivation [ 
	^ anActivation activate
]

{ #category : #accessing }
FBFlowInstance >> events [
	^ events ifNil: [ 
		events := OrderedCollection new ]
]

{ #category : #accessing }
FBFlowInstance >> eventsOfActivation: aFBActivation [ 
	^ self events select: [ :each | (each isKindOf: FBNodeActivationEvent) and: [ each activation = aFBActivation ] ]
]

{ #category : #events }
FBFlowInstance >> eventsOfNode: aFBNode [
	^ (self activationOfNode: aFBNode) ifNotNil: [ :activation | activation events ]
]

{ #category : #executing }
FBFlowInstance >> execute [
	self executor execute
]

{ #category : #executing }
FBFlowInstance >> executeWith: anObject [
	self executor 
		initialValue: anObject;
		execute
]

{ #category : #finalization }
FBFlowInstance >> executor [ 
	^ executor ifNil: [
		executor := FBFlowExecutor new 
			flowInstance: self ]
]

{ #category : #accessing }
FBFlowInstance >> flow [
	^ flow
]

{ #category : #accessing }
FBFlowInstance >> flow: aFBFlow [ 
	flow := aFBFlow 
]

{ #category : #convenience }
FBFlowInstance >> handleActivationError: error activation: anActivation [
	anActivation errored.
	self addEvent: (FBNodeActivationErrored new activationError: error messageText) 
]

{ #category : #accessing }
FBFlowInstance >> id [

	^ id
]

{ #category : #accessing }
FBFlowInstance >> id: anObject [

	id := anObject
]

{ #category : #accessing }
FBFlowInstance >> initialValue: anObject [
	self executor initialValue: anObject
]

{ #category : #initialization }
FBFlowInstance >> initialize [ 
	super initialize.
	id := FBIdGenerator current newId
]

{ #category : #'as yet unclassified' }
FBFlowInstance >> inspectionFlow [
	<inspectorPresentationOrder: 0 title: 'flow'>
	^ SpRoassal3InspectorPresenter  new 
		canvas: (FBFlowMapBuilder new 
			nodes: flow nodes;
			activations: self executor activations;
			build )
		yourself
]

{ #category : #testing }
FBFlowInstance >> isDone [
	^ executor isDone
]

{ #category : #accessing }
FBFlowInstance >> nextNode [
	^ self nextTransition target
]

{ #category : #accessing }
FBFlowInstance >> nextTransition [
	^ executor firstPending
]

{ #category : #accessing }
FBFlowInstance >> pending [
	^ self executor pending
]

{ #category : #convenience }
FBFlowInstance >> postActivation: anActivation [ 
	anActivation postProcess: self
]

{ #category : #printing }
FBFlowInstance >> printOn: aStream [ 
	aStream << 'flow instance id=' << id asString
]

{ #category : #convenience }
FBFlowInstance >> processActivation: anActivation [
	anActivation prepareBehavior.
	self basicActivate: anActivation.
	anActivation postProcessActivation 

]

{ #category : #accessing }
FBFlowInstance >> start [
	^ flow start
]

{ #category : #accessing }
FBFlowInstance >> state [
	self executor isCreated ifTrue: [ ^ #created ].
	self executor isRunning ifTrue: [ ^ #running ].
	self executor hasErrors ifTrue: [ ^ #error ].
	self executor isWaiting ifTrue: [ ^ #waiting ].
	self executor isDone ifTrue: [ ^ #done ].

]

{ #category : #executing }
FBFlowInstance >> step [
	^ self executor step
]
