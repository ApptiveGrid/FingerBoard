Class {
	#name : #FBFlowExecutor,
	#superclass : #Object,
	#instVars : [
		'instance',
		'pending',
		'activations',
		'suspended',
		'initialValue',
		'state'
	],
	#category : #'FingerBoard-Core'
}

{ #category : #'as yet unclassified' }
FBFlowExecutor >> activationBefore: aFBActivation [ 

	^ activations before: aFBActivation 
]

{ #category : #accessing }
FBFlowExecutor >> activations [
	^ activations
]

{ #category : #adding }
FBFlowExecutor >> addPending: aFBNode [ 
	pending add: aFBNode 
]

{ #category : #accessing }
FBFlowExecutor >> addWaiting: aNode [
	suspended add: aNode
]

{ #category : #accessing }
FBFlowExecutor >> atEnd [
	^ state = #completed
]

{ #category : #adding }
FBFlowExecutor >> completed [
	state := #completed
]

{ #category : #executing }
FBFlowExecutor >> execute [
	[ pending isEmpty ] whileFalse: [
		self step ]
	
]

{ #category : #'as yet unclassified' }
FBFlowExecutor >> executeNode: aFBNode with: anObject [
	| activation |
	activation := self newActivation 
		node: aFBNode;
		argument: anObject.
	activations add: activation.
	^ aFBNode behaviorClass new
		activation: activation;
		execute
	"^ activation invoke"
	
]

{ #category : #executing }
FBFlowExecutor >> executeWith: anObject [
	| transition lastValue argument |
	lastValue := anObject.
	[ pending isEmpty ] whileFalse: [
		transition := pending removeFirst. 
		argument := lastValue.
		lastValue := self executeNode: transition with: argument ]
	
]

{ #category : #accessing }
FBFlowExecutor >> firstPending [
	^ pending first
]

{ #category : #accessing }
FBFlowExecutor >> initialValue: anObject [
	initialValue := anObject
]

{ #category : #initialization }
FBFlowExecutor >> initialize [ 
	super initialize.
	activations := OrderedCollection new.
	pending := OrderedCollection new.
	suspended := OrderedCollection new.
	state := #initialized
]

{ #category : #accessing }
FBFlowExecutor >> instance: aFBFlowInstance [ 
	instance := aFBFlowInstance.
	pending add: instance start
]

{ #category : #testing }
FBFlowExecutor >> isComplete [ 
	^ state = #completed
]

{ #category : #'as yet unclassified' }
FBFlowExecutor >> newActivation [ 
	^ FBActivation new
		executor: self
]

{ #category : #accessing }
FBFlowExecutor >> pending [
	^ pending
]

{ #category : #accessing }
FBFlowExecutor >> state [

	^ state
]

{ #category : #accessing }
FBFlowExecutor >> state: anObject [

	state := anObject
]

{ #category : #executing }
FBFlowExecutor >> step [
	| transition argument next |
	transition := pending removeFirst. 
	(state = #initialized) 
		ifTrue: [ 
			argument := initialValue.
			next := transition.
			state := #running.
			 ]
		ifFalse: [ 
			argument := (self activations reverse 
				detect: [ :each | each node = transition source ]) value.
			next := transition target ].
	self executeNode: next with: argument
]
