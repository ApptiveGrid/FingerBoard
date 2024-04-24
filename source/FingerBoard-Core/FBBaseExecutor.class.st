Class {
	#name : #FBBaseExecutor,
	#superclass : #Object,
	#instVars : [
		'flowInstance',
		'pending',
		'suspended',
		'suspendedExecutor'
	],
	#category : #'FingerBoard-Core-Model'
}

{ #category : #convenience }
FBBaseExecutor >> activate: activation [ 
	self addEvent: (FBNodeActivationStarted new
		activation: activation).
	activation node activateWith: activation.
	self addEvent: (FBNodeActivationDone new
		activation: activation)

	
]

{ #category : #convenience }
FBBaseExecutor >> activateProtected: activation [
	[ [ self activate: activation ]
		on: FBError  
		do: [ :error |
			activation errored.
			self addEvent: (FBNodeActivationErrored new activationError: error messageText)  ] ]
		on: Error 
		do: [ :error | 
			activation errored.
			self addEvent: (FBNodeActivationErrored new activationError: error messageText).
			error pass ]
]

{ #category : #'as yet unclassified' }
FBBaseExecutor >> activationBefore: aFBActivation [ 

	^ self activations before: aFBActivation 
]

{ #category : #accessing }
FBBaseExecutor >> activationClass [
	^ flowInstance activationClass
]

{ #category : #accessing }
FBBaseExecutor >> activations [
	^ flowInstance activations
]

{ #category : #adding }
FBBaseExecutor >> addEvent: anEvent [ 
	flowInstance addEvent: anEvent 
]

{ #category : #adding }
FBBaseExecutor >> addPending: aFBNode [ 
	pending add: aFBNode 
]

{ #category : #accessing }
FBBaseExecutor >> addWaiting: aNode [
	suspended add: aNode
]

{ #category : #accessing }
FBBaseExecutor >> firstPending [
	^ pending first
]

{ #category : #accessing }
FBBaseExecutor >> flow [
	^ flowInstance flow
]

{ #category : #accessing }
FBBaseExecutor >> flowInstance [

	^ flowInstance
]

{ #category : #accessing }
FBBaseExecutor >> flowInstance: aFBFlowInstance [ 
	flowInstance := aFBFlowInstance.

]

{ #category : #testing }
FBBaseExecutor >> hasErrors [
	^ self activations anySatisfy: [ :each | each hasError ]
]

{ #category : #testing }
FBBaseExecutor >> hasPending [
	^ pending notEmpty 
]

{ #category : #initialization }
FBBaseExecutor >> initialize [ 
	super initialize.
	pending := OrderedCollection new.
	suspended := OrderedCollection new
]

{ #category : #testing }
FBBaseExecutor >> isCreated [ 
	^ (pending size = 1) and: [ pending first = flowInstance start ]
]

{ #category : #accessing }
FBBaseExecutor >> isDone [
	^ pending isEmpty & suspended isEmpty
]

{ #category : #testing }
FBBaseExecutor >> isRunning [
	^ pending notEmpty
]

{ #category : #testing }
FBBaseExecutor >> isWaiting [
	^ pending isEmpty & suspended notEmpty
]

{ #category : #accessing }
FBBaseExecutor >> lastValueOf: aFBNode [
	^ (self activations reverse 
				detect: [ :each | each node = aFBNode ]) value.
]

{ #category : #accessing }
FBBaseExecutor >> pending [
	^ pending
]

{ #category : #finalization }
FBBaseExecutor >> rootExecutor [
	^ suspendedExecutor 
		ifNotNil: [ suspendedExecutor rootExecutor ]
		ifNil: [ self ]
]

{ #category : #'as yet unclassified' }
FBBaseExecutor >> scheduleStart [
	pending add: flowInstance start
]

{ #category : #accessing }
FBBaseExecutor >> stop [
	flowInstance popExecutor: suspendedExecutor 
]

{ #category : #accessing }
FBBaseExecutor >> suspendedExecutor [ 
	^ suspendedExecutor
]

{ #category : #accessing }
FBBaseExecutor >> suspendedExecutor: anObject [

	suspendedExecutor := anObject
]
