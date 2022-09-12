Class {
	#name : #FBTask,
	#superclass : #FBActivity,
	#category : #'FingerBoard-Core'
}

{ #category : #accessing }
FBTask >> defaultBehaviorClass [
	^ FBTaskBehavior
]
