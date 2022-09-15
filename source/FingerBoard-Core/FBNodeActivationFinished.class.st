Class {
	#name : #FBNodeActivationFinished,
	#superclass : #FBNodeActivationEvent,
	#category : #'FingerBoard-Core'
}

{ #category : #printing }
FBNodeActivationFinished >> printOn: aStream [ 
	super printOn: aStream.
	aStream << ' finished'
]
