Class {
	#name : #FBFlowExecutor,
	#superclass : #Object,
	#instVars : [
		'instance',
		'pending',
		'activations',
		'suspended'
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

{ #category : #adding }
FBFlowExecutor >> completed [
	instance state: #completed
]

{ #category : #executing }
FBFlowExecutor >> execute [
	^ self executeWith: nil
]

{ #category : #'as yet unclassified' }
FBFlowExecutor >> executeNode: aFBNode with: anObject [
	| activation |
	activation := self newActivation 
		node: aFBNode;
		argument: anObject.
	activations add: activation.
	^ activation invoke
"	aFBNode executeIn: self"
	
]

{ #category : #executing }
FBFlowExecutor >> executeWith: anObject [
	| node lastValue argument |
	lastValue := anObject.
	[ pending isEmpty ] whileFalse: [
		node := pending removeFirst. 
		argument := lastValue.
		lastValue := self executeNode: node with: argument ]
	
]

{ #category : #initialization }
FBFlowExecutor >> initialize [ 
	super initialize.
	activations := OrderedCollection new.
	pending := OrderedCollection new.
	suspended := OrderedCollection new
]

{ #category : #accessing }
FBFlowExecutor >> instance: aFBFlowInstance [ 
	instance := aFBFlowInstance.
	pending add: instance start
]

{ #category : #'as yet unclassified' }
FBFlowExecutor >> newActivation [ 
	^ FBActivation new
		executor: self
]
