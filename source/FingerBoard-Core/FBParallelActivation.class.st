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

{ #category : #'as yet unclassified' }
FBParallelActivation >> stateBorder [
	| map border |
	map := { 
		#created -> Color green.
		#running -> Color yellow.
		#waiting -> Color red.
		#done -> Color blue } asDictionary.
	border := RSBorder new 
		width: 2; 
		color: ((map at: state)  alpha: 0.8).
	(state = #waiting) ifTrue: [ border dashArray: #( 2 ) ].
	^ border
		
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
