Class {
	#name : #FBActivation,
	#superclass : #FBBaseActivation,
	#instVars : [
		'value',
		'metadata',
		'argument'
	],
	#category : #'FingerBoard-Core-Model'
}

{ #category : #activation }
FBActivation >> activate [ 
	node activateWith: self.
]

{ #category : #accessing }
FBActivation >> argument [
	^ argument
]

{ #category : #accessing }
FBActivation >> argument: aCollection [ 
	argument := aCollection
]

{ #category : #events }
FBActivation >> events [
	^ self flowInstance eventsOfActivation: self
]

{ #category : #accessing }
FBActivation >> instance [
	^ executor flowInstance
]

{ #category : #'as yet unclassified' }
FBActivation >> isDone [
	^ state = #done
]

{ #category : #accessing }
FBActivation >> metadata [
	^ metadata ifNil: [ 
		metadata := FBActivationMetadata new 
			schema: self metadataSchema;
			activation: self;
			yourself ]
]

{ #category : #accessing }
FBActivation >> metadataAt: aString [ 
	^ self metadata at: aString
]

{ #category : #accessing }
FBActivation >> metadataAt: key ifAbsent: aBlock [
	^ self metadata 
		at: key 
		ifAbsent: aBlock
]

{ #category : #accessing }
FBActivation >> metadataAt: key put: anObject [ 
	self metadata  
		at: key 
		put: anObject
]

{ #category : #accessing }
FBActivation >> metadataSchema [
	^ node metadataSchema
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

{ #category : #'as yet unclassified' }
FBActivation >> suspend [
	state := #waiting.
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
	state := #waiting.
	executor addWaiting: aNode
]
