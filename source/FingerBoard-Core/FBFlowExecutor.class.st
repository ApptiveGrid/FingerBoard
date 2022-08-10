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

{ #category : #execution }
FBFlowExecutor >> execute [
	| node |
	[ pending isEmpty ] whileFalse: [
		node := pending removeFirst. 
		self executeNode: node ]
	
]

{ #category : #'as yet unclassified' }
FBFlowExecutor >> executeNode: aFBNode [ 
	activations 
		at: aFBNode 
		put: (FBActivation new node: aFBNode ).
	aFBNode executeIn: self
]

{ #category : #initialization }
FBFlowExecutor >> initialize [ 
	super initialize.
	activations := OrderedDictionary new.
	pending := OrderedCollection new
]

{ #category : #accessing }
FBFlowExecutor >> instance: aFBFlowInstance [ 
	instance := aFBFlowInstance.
	pending add: instance start
]

{ #category : #'as yet unclassified' }
FBFlowExecutor >> valueAtNode: aFBNode put: anObject [
	(activations at: aFBNode) value: anObject 
]

{ #category : #'as yet unclassified' }
FBFlowExecutor >> valueForNode: aFBNode [
	^ (activations at: aFBNode) value
]
