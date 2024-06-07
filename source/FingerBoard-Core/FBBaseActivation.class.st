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

{ #category : #activation }
FBBaseActivation >> activate [
	node activateWith: self 
]

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

{ #category : #accessing }
FBBaseActivation >> flow [
	^ executor flow
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
		executor flowInstance executor addPending: aTransition ]
]

{ #category : #testing }
FBBaseActivation >> hasError [
	^ state = #error
]

{ #category : #accessing }
FBBaseActivation >> id [

	^ id
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

{ #category : #accessing }
FBBaseActivation >> state [
	^ state
]

{ #category : #'as yet unclassified' }
FBBaseActivation >> stateBorder [
	| map border |
	map := { 
		#created -> Color gray.
		#running -> Color blue.
		#waiting -> Color orange.
		#done -> Color green.
		#error -> Color red } asDictionary.
	border := RSBorder new 
		width: 2; 
		color: ((map at: state)  alpha: 0.8).
	(state = #waiting) ifTrue: [ border dashArray: #( 2 ) ].
	^ border
		
]
