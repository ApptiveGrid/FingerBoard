Class {
	#name : #FBErrorTestTask,
	#superclass : #FBTask,
	#category : #'FingerBoard-Core-Tests'
}

{ #category : #accessing }
FBErrorTestTask >> value [
	^ 1/0
]
