Class {
	#name : #FBActivation,
	#superclass : #Object,
	#instVars : [
		'timestamp',
		'node',
		'value',
		'argument',
		'executor',
		'state',
		'environment'
	],
	#category : #'FingerBoard-Core'
}

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
		environment := FBEnvironment new activation: self ]
]

{ #category : #accessing }
FBActivation >> environmentAt: key put: anObject [ 
	self environment  
		at: key 
		put: anObject
]

{ #category : #accessing }
FBActivation >> executor [

	^ executor
]

{ #category : #accessing }
FBActivation >> executor: aFBFlowExecutor [ 
	executor := aFBFlowExecutor 
]

{ #category : #'as yet unclassified' }
FBActivation >> followTransition: aTransition [
	executor addPending: aTransition target
]

{ #category : #initialization }
FBActivation >> initialize [ 
	super initialize.
	timestamp := DateAndTime now.
	state := #initialized
]

{ #category : #'as yet unclassified' }
FBActivation >> invoke [
	state := #executing.
	node executeIn: self.
	^ value
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
