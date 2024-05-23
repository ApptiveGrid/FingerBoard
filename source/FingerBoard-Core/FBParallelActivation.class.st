Class {
	#name : #FBParallelActivation,
	#superclass : #FBBaseActivation,
	#instVars : [
		'values',
		'arguments'
	],
	#category : #'FingerBoard-Core-Model'
}

{ #category : #accessing }
FBParallelActivation >> argument [ 
	^ arguments at: executor index
]

{ #category : #accessing }
FBParallelActivation >> argument: anObject [ 
	arguments at: executor index put: anObject 
]

{ #category : #accessing }
FBParallelActivation >> arguments [
	^ arguments
]

{ #category : #initialization }
FBParallelActivation >> initializeValues: anInteger [ 
	arguments := Array new: anInteger.
	values := Array new: anInteger
]

{ #category : #printing }
FBParallelActivation >> printOn: aStream [ 
	aStream << 'parallel activation: '.
	node printOn: aStream.
	aStream << ', arguments: '.
	arguments printOn: aStream.
	aStream << ', values: '.
	values printOn: aStream 
	
]

{ #category : #evaluating }
FBParallelActivation >> value [
	^ values
]

{ #category : #accessing }
FBParallelActivation >> value: anObject [ 
	values at: executor index put: anObject 
]

{ #category : #accessing }
FBParallelActivation >> values: aCollection [ 
	values := aCollection
]
