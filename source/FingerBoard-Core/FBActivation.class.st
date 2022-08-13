Class {
	#name : #FBActivation,
	#superclass : #Object,
	#instVars : [
		'timestamp',
		'node',
		'value',
		'argument',
		'executor'
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
	timestamp := DateAndTime now
]

{ #category : #'as yet unclassified' }
FBActivation >> invoke [
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
FBActivation >> value [

	^ value
]

{ #category : #accessing }
FBActivation >> value: anObject [

	value := anObject
]
