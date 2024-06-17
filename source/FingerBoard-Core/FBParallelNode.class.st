Class {
	#name : #FBParallelNode,
	#superclass : #FBTask,
	#category : #'FingerBoard-Core-Model'
}

{ #category : #accessing }
FBParallelNode >> activationClass [ 
	^ FBParallelActivation  
]

{ #category : #accessing }
FBParallelNode >> defaultBehaviorClass [
	^ FBParallelNodeBehavior 
]

{ #category : #accessing }
FBParallelNode >> outputFor: anActivation [
	"unlike other nodes, the parallel node output return the current input value being processed.
	if no execution in progress, returns the first element of the input value"

	| executor |
	executor := anActivation instance parallelExecutorFrom: self.
	^ executor outputFor: anActivation
]
