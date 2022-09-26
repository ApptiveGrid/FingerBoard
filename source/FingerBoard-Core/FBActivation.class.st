Class {
	#name : #FBActivation,
	#superclass : #Object,
	#instVars : [
		'id',
		'timestamp',
		'node',
		'value',
		'argument',
		'executor',
		'state',
		'environment'
	],
	#category : #'FingerBoard-Core-Model'
}

{ #category : #activation }
FBActivation >> activate [ 
	self activateWithErrorHandling 
]

{ #category : #convenience }
FBActivation >> activateWithErrorHandling [
	[ [ 
		self addEvent: FBNodeActivationStarted new.
		node activateWith: self.
	  	self addEvent: FBNodeActivationDone new ]
		on: FBError  
		do: [ :error |
			self activationError: error ] ]
		on: Error 
		do: [ :error | 
			self activationError: error.
			error pass ]
]

{ #category : #convenience }
FBActivation >> activationError: error [
	self errored.
	self addEvent: (FBNodeActivationErrored new activationError: error description) 
]

{ #category : #events }
FBActivation >> addEvent: aFBFlowEvent [
	self flowInstance addEvent: (aFBFlowEvent activation: self)
]

{ #category : #accessing }
FBActivation >> argument [
	^ argument
]

{ #category : #accessing }
FBActivation >> argument: anObject [
	argument := anObject 
]

{ #category : #'as yet unclassified' }
FBActivation >> done [
	state := #done
]

{ #category : #accessing }
FBActivation >> environment [
	^ environment ifNil: [ 
		environment := FBEnvironment new 
			schema: self environmentSchema;
			activation: self;
			yourself ]
]

{ #category : #accessing }
FBActivation >> environmentAt: aString [ 
	^ self environment at: aString
]

{ #category : #accessing }
FBActivation >> environmentAt: key ifAbsent: aBlock [
	^ self environment 
		at: key 
		ifAbsent: aBlock
]

{ #category : #accessing }
FBActivation >> environmentAt: key put: anObject [ 
	self environment  
		at: key 
		put: anObject
]

{ #category : #accessing }
FBActivation >> environmentSchema [
	^ node environmentSchema
]

{ #category : #'as yet unclassified' }
FBActivation >> errored [ 
	state := #error
]

{ #category : #events }
FBActivation >> events [
	^ self flowInstance eventsOfActivation: self
]

{ #category : #accessing }
FBActivation >> executor [

	^ executor
]

{ #category : #accessing }
FBActivation >> executor: aFBFlowExecutor [ 
	executor := aFBFlowExecutor 
]

{ #category : #accessing }
FBActivation >> flow [
	^ executor flow
]

{ #category : #events }
FBActivation >> flowInstance [
	^ executor flowInstance 
]

{ #category : #'as yet unclassified' }
FBActivation >> followAll: aCollection [
	aCollection do: [ :transition |
		 self followTransition: transition ]
]

{ #category : #'as yet unclassified' }
FBActivation >> followAllOutgoing [
	self node outgoing do: [ :transition |
		 self followTransition: transition ]
]

{ #category : #'as yet unclassified' }
FBActivation >> followTransition: transition [
self halt.
	transition asApptiveScriptScope 
		activation: self;
		useDuring: [ 
		transition matchesCondition ifTrue: [  
			executor addPending: transition ] ]
]

{ #category : #accessing }
FBActivation >> id [

	^ id
]

{ #category : #initialization }
FBActivation >> initialize [ 
	super initialize.
	id := FBIdGenerator current newId.
	timestamp := DateAndTime now.
	state := #initialized
]

{ #category : #accessing }
FBActivation >> instance [
	^ executor flowInstance
]

{ #category : #accessing }
FBActivation >> node [
	^ node
]

{ #category : #accessing }
FBActivation >> node: aFBNode [
	node := aFBNode
]

{ #category : #accessing }
FBActivation >> previous [
	^ executor activationBefore: self 
]

{ #category : #printing }
FBActivation >> printOn: aStream [ 
	aStream << 'activation: '.
	node printOn: aStream.
	aStream << ', argument: '.
	argument printOn: aStream.
	aStream << ', value: '.
	value printOn: aStream 
	
]

{ #category : #accessing }
FBActivation >> returnValue: anInteger [ 
	self shouldBeImplemented.
]

{ #category : #accessing }
FBActivation >> state [
	^ state
]

{ #category : #'as yet unclassified' }
FBActivation >> stateBorder [
	| map border |
	map := { 
		#initialized -> Color green.
		#executing -> Color yellow.
		#suspended -> Color red.
		#done -> Color blue } asDictionary.
	border := RSBorder new 
		width: 2; 
		color: ((map at: state)  alpha: 0.8).
	(state = #suspended) ifTrue: [ border dashArray: #( 2 ) ].
	^ border
		
]

{ #category : #'as yet unclassified' }
FBActivation >> suspend [
	state := #suspended.
	executor addWaiting: node
]

{ #category : #accessing }
FBActivation >> value [

	^ value
]

{ #category : #accessing }
FBActivation >> value: anObject [

	value := anObject
]

{ #category : #'as yet unclassified' }
FBActivation >> waitForNode: aNode [
	state := #suspended.
	executor addWaiting: aNode
]
