Class {
	#name : #FBFlowInstance,
	#superclass : #Object,
	#instVars : [
		'id',
		'flow',
		'executor',
		'executors',
		'announcer',
		'events',
		'activations'
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
	self addEvent: (FBNodeActivationStarted new
		activation: anActivation).
	anActivation activate.
	self addEvent: (FBNodeActivationDone new
		activation: anActivation)

]

{ #category : #convenience }
FBFlowInstance >> activateProtected: activation [
	[ [ self activate: activation ]
		on: FBError  
		do: [ :error |
			activation errored.
			self addEvent: (FBNodeActivationErrored new 
				activation: activation;
				activationError: error messageText)  ] ]
		on: Error 
		do: [ :error | 
			activation errored.
			self addEvent: (FBNodeActivationErrored new 
				activation: activation;
				activationError: error messageText).
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
	^ activations ifNil: [ 
		activations := OrderedCollection new ]
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
	^ (executor = self rootExecutor) and: [  
		executors allSatisfy: [ :each | each atEnd ]
		].
]

{ #category : #finalization }
FBFlowInstance >> buildRootExecutor [
	^ FBFlowExecutor new 
			flowInstance: self;
			scheduleStart 
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
	[ self executor hasPending ] whileTrue: [
		executor step ]

]

{ #category : #executing }
FBFlowInstance >> executeWith: anObject [
	self executor initialValue: anObject.
	self execute
]

{ #category : #accessing }
FBFlowInstance >> executor [ 
	^ executor ifNil: [ 
		executor := self buildRootExecutor.
		executors add: executor ]
]

{ #category : #accessing }
FBFlowInstance >> executors [

	^ executors
]

{ #category : #accessing }
FBFlowInstance >> flow [
	^ flow
]

{ #category : #accessing }
FBFlowInstance >> flow: aFBFlow [ 
	flow := aFBFlow 
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
	id := FBIdGenerator current newId.
	executors := OrderedCollection new.
]

{ #category : #'as yet unclassified' }
FBFlowInstance >> inspectionFlow [
	<inspectorPresentationOrder: 0 title: 'flow'>
	^ SpRoassal3InspectorPresenter  new 
		canvas: (FBFlowMapBuilder new 
			nodes: flow nodes;
			activations: self rootExecutor activations;
			build )
		yourself
]

{ #category : #testing }
FBFlowInstance >> isDone [
	^ executor isDone
]

{ #category : #testing }
FBFlowInstance >> isRootExecutor [

	^ self rootExecutor = self executor
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
FBFlowInstance >> parallelExecutorFrom: aNode [

	^ executors detect: [ :each | each isParallel and: [each node = aNode] ]
]

{ #category : #accessing }
FBFlowInstance >> pending [
	^ self executor pending
]

{ #category : #'as yet unclassified' }
FBFlowInstance >> popExecutor: anExecutor [ 
	executor := anExecutor
]

{ #category : #printing }
FBFlowInstance >> printOn: aStream [ 
	aStream << 'flow instance id=' << id asString
]

{ #category : #'as yet unclassified' }
FBFlowInstance >> pushExecutor: anExecutor [
 
	executors add: anExecutor.
	executor := anExecutor 
		flowInstance: self;
		suspendedExecutor: executor;
		yourself
]

{ #category : #finalization }
FBFlowInstance >> rootExecutor [
	^ executor rootExecutor
]

{ #category : #accessing }
FBFlowInstance >> start [
	^ flow start
]

{ #category : #accessing }
FBFlowInstance >> state [

	
	self rootExecutor isCreated ifTrue: [ ^ #created ].
	(self isRootExecutor not or: [self rootExecutor isRunning]) ifTrue: [ ^ #running ].
	(self executors anySatisfy:[:each | each hasErrors]) ifTrue: [ ^ #error ].
	(self executors anySatisfy:[:each | each isWaiting])  ifTrue: [ ^ #waiting ].
	(self executors anySatisfy:[:each | each isDone]) ifTrue: [ ^ #done ].

]

{ #category : #executing }
FBFlowInstance >> step [
	^ self executor step
]

{ #category : #accessing }
FBFlowInstance >> suspended [

	^ executors flatCollect:  [ :each | each suspended ]
]
