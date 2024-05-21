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
