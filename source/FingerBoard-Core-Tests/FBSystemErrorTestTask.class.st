Class {
	#name : #FBSystemErrorTestTask,
	#superclass : #FBTask,
	#category : #'FingerBoard-Core-Tests'
}

{ #category : #accessing }
FBSystemErrorTestTask >> value [
	^ 1/0
]
