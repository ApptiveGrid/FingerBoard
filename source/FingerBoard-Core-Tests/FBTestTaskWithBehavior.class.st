Class {
	#name : #FBTestTaskWithBehavior,
	#superclass : #FBTask,
	#category : #'FingerBoard-Core-Tests'
}

{ #category : #accessing }
FBTestTaskWithBehavior >> defaultBehaviorClass [ 
	^ FBTestTaskBehavior 
]

{ #category : #accessing }
FBTestTaskWithBehavior >> value [
	^ 10 atRandom 
]
