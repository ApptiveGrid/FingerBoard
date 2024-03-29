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
		'metadata'
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
	self addEvent: (FBNodeActivationErrored new activationError: error messageText) 
]

{ #category : #events }
FBActivation >> addEvent: aFBFlowEvent [

	self flowInstance addEvent: (aFBFlowEvent
			 activation: self;
			 yourself)
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
FBActivation >> followTransition: aTransition [
	(aTransition conditionMatches: self value) ifTrue: [ 
		executor addPending: aTransition ]
]

{ #category : #testing }
FBActivation >> hasError [
	^ state = #error
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
	state := #created
]

{ #category : #accessing }
FBActivation >> instance [
	^ executor flowInstance
]

{ #category : #'as yet unclassified' }
FBActivation >> isDone [
	^ state = #done
]

{ #category : #accessing }
FBActivation >> metadata [
	^ metadata ifNil: [ 
		metadata := FBActivationMetadata new 
			schema: self metadataSchema;
			activation: self;
			yourself ]
]

{ #category : #accessing }
FBActivation >> metadataAt: aString [ 
	^ self metadata at: aString
]

{ #category : #accessing }
FBActivation >> metadataAt: key ifAbsent: aBlock [
	^ self metadata 
		at: key 
		ifAbsent: aBlock
]

{ #category : #accessing }
FBActivation >> metadataAt: key put: anObject [ 
	self metadata  
		at: key 
		put: anObject
]

{ #category : #accessing }
FBActivation >> metadataSchema [
	^ node metadataSchema
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
		#created -> Color green.
		#running -> Color yellow.
		#waiting -> Color red.
		#done -> Color blue } asDictionary.
	border := RSBorder new 
		width: 2; 
		color: ((map at: state)  alpha: 0.8).
	(state = #waiting) ifTrue: [ border dashArray: #( 2 ) ].
	^ border
		
]

{ #category : #'as yet unclassified' }
FBActivation >> suspend [
	state := #waiting.
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
	state := #waiting.
	executor addWaiting: aNode
]
