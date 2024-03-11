Class {
	#name : #FBSystemErrorTestTask,
	#superclass : #FBTask,
	#category : #'FingerBoard-Core-Tests'
}

{ #category : #execution }
FBSystemErrorTestTask >> executeWith: anObject [
	^ self value
]

{ #category : #accessing }
FBSystemErrorTestTask >> value [
	^ 1/0
]
