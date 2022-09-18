Class {
	#name : #FBFlowExecutor,
	#superclass : #Object,
	#instVars : [
		'flowInstance',
		'pending',
		'activations',
		'suspended',
		'initialValue',
		'state'
	],
	#category : #'FingerBoard-Core-Model'
}

{ #category : #convenience }
FBFlowExecutor >> activate: activation [ 
	activation activate
]

{ #category : #'as yet unclassified' }
FBFlowExecutor >> activationBefore: aFBActivation [ 

	^ activations before: aFBActivation 
]

{ #category : #accessing }
FBFlowExecutor >> activationClass [
	^ flowInstance activationClass
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

{ #category : #accessing }
FBFlowExecutor >> firstPending [
	^ pending first
]

{ #category : #accessing }
FBFlowExecutor >> flowInstance [

	^ flowInstance
]

{ #category : #accessing }
FBFlowExecutor >> flowInstance: aFBFlowInstance [ 
	flowInstance := aFBFlowInstance.
	pending add: flowInstance start
]

{ #category : #accessing }
FBFlowExecutor >> initialValue [
	^ initialValue
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

{ #category : #testing }
FBFlowExecutor >> isComplete [ 
	^ state = #completed
]

{ #category : #accessing }
FBFlowExecutor >> lastValueOf: aFBNode [
	^ (self activations reverse 
				detect: [ :each | each node = aFBNode ]) value.
]

{ #category : #'as yet unclassified' }
FBFlowExecutor >> newActivation [ 
	^ self activationClass new
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
	| transition activation lastValue |
	(state = #initialized) 
		ifTrue: [ 
			flowInstance addEvent: FBFlowInstanceStarted new.
			state := #running ].
	transition := pending removeFirst. 
	lastValue := transition source lastValueIn: self.
	flowInstance addEvent: (FBTransitionFollowed new transition: transition; value: lastValue).
	activation := self newActivation 
		node: transition target;
		argument: lastValue.
	activations add: activation.
	self activate: activation 
]
