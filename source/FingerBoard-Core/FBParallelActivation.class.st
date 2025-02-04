Class {
	#name : 'FBParallelActivation',
	#superclass : 'FBBaseActivation',
	#instVars : [
		'values',
		'arguments',
		'metadata'
	],
	#category : 'FingerBoard-Core-Model',
	#package : 'FingerBoard-Core',
	#tag : 'Model'
}

{ #category : 'accessing' }
FBParallelActivation >> argument [ 
	^ arguments at: executor index
]

{ #category : 'accessing' }
FBParallelActivation >> argument: anObject [ 
	arguments at: executor index put: anObject 
]

{ #category : 'accessing' }
FBParallelActivation >> arguments [
	^ arguments
]

{ #category : 'accessing' }
FBParallelActivation >> done [

	"the parallel activation is done only after processing the last elements of the input list"
	executor isLastIndex ifTrue: [ 
		super done
		 ]
]

{ #category : 'initialization' }
FBParallelActivation >> initializeValues: anInteger [

	arguments := Array new: anInteger.
	values := Array new: anInteger.
	metadata := Array new: anInteger.
]

{ #category : 'as yet unclassified' }
FBParallelActivation >> metadataAt: key ifAbsent: aBlock [

	^ (self metadataAtIndex: executor index) at: key 
		ifAbsent: aBlock
]

{ #category : 'as yet unclassified' }
FBParallelActivation >> metadataAt: key put: anObject [ 

	(self metadataAtIndex: executor index) at: key 
		put: anObject
]

{ #category : 'as yet unclassified' }
FBParallelActivation >> metadataAtIndex: index [

	^ (metadata at: index) ifNil: [
		  metadata at: index put: (FBActivationMetadata new
				   schema: self metadataSchema;
				   activation: self;
				   yourself) ]
]

{ #category : 'initialization' }
FBParallelActivation >> metadataSchema [
	^ node metadataSchema
]

{ #category : 'accessing' }
FBParallelActivation >> output [

	^ executor outputFor: self
]

{ #category : 'printing' }
FBParallelActivation >> printOn: aStream [ 
	aStream << 'parallel activation: '.
	node printOn: aStream.
	aStream << ', arguments: '.
	arguments printOn: aStream.
	aStream << ', values: '.
	values printOn: aStream 
	
]

{ #category : 'evaluating' }
FBParallelActivation >> value [
	^ values
]

{ #category : 'accessing' }
FBParallelActivation >> value: anObject [ 
	values at: executor index put: anObject 
]

{ #category : 'accessing' }
FBParallelActivation >> values: aCollection [ 
	values := aCollection
]
