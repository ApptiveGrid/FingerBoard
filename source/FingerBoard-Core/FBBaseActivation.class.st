Class {
	#name : #FBBaseActivation,
	#superclass : #Object,
	#instVars : [
		'executor',
		'node',
		'state',
		'id',
		'timestamp'
	],
	#category : #'FingerBoard-Core-Model'
}

{ #category : #events }
FBBaseActivation >> addEvent: aFBFlowEvent [

	self flowInstance addEvent: (aFBFlowEvent
			 activation: self;
			 yourself)
]

{ #category : #'as yet unclassified' }
FBBaseActivation >> done [
	state := #done
]

{ #category : #'as yet unclassified' }
FBBaseActivation >> errored [ 
	state := #error
]

{ #category : #accessing }
FBBaseActivation >> executor [

	^ executor
]

{ #category : #accessing }
FBBaseActivation >> executor: aFBFlowExecutor [ 
	executor := aFBFlowExecutor 
]

{ #category : #events }
FBBaseActivation >> flowInstance [
	^ executor flowInstance 
]

{ #category : #'as yet unclassified' }
FBBaseActivation >> followAll: aCollection [
	aCollection do: [ :transition |
		 self followTransition: transition ]
]

{ #category : #'as yet unclassified' }
FBBaseActivation >> followAllOutgoing [
	self node outgoing do: [ :transition |
		 self followTransition: transition ]
]

{ #category : #'as yet unclassified' }
FBBaseActivation >> followTransition: aTransition [
	(aTransition conditionMatches: self value) ifTrue: [ 
		executor flowInstance currentExecutor addPending: aTransition ]
]

{ #category : #initialization }
FBBaseActivation >> initialize [ 
	super initialize.
	id := FBIdGenerator current newId.
	timestamp := DateAndTime now.
	state := #created
]

{ #category : #accessing }
FBBaseActivation >> node [
	^ node
]

{ #category : #accessing }
FBBaseActivation >> node: aFBNode [
	node := aFBNode
]
