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
	
	"unlike other nodes, the parallel node output return the current input value being processed"
	^ anActivation value at: anActivation instance executor index
]
