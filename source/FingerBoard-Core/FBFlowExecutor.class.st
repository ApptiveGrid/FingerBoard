Class {
	#name : #FBFlowExecutor,
	#superclass : #Object,
	#instVars : [
		'instance',
		'pending',
		'activations'
	],
	#category : #'FingerBoard-Core'
}

{ #category : #adding }
FBFlowExecutor >> addPending: aFBNode [ 
	pending add: aFBNode 
]

{ #category : #adding }
FBFlowExecutor >> completed [
	instance state: #completed
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
	pending := OrderedCollection new
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
