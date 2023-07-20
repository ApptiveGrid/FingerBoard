Class {
	#name : #FBTask,
	#superclass : #FBActivity,
	#category : #'FingerBoard-Core-Model'
}

{ #category : #accessing }
FBTask >> defaultBehaviorClass [
	^ FBTaskBehavior
]
