Class {
	#name : #FBNodeActivationDone,
	#superclass : #FBNodeActivationEvent,
	#category : #'FingerBoard-Core'
}

{ #category : #printing }
FBNodeActivationDone >> printOn: aStream [ 
	super printOn: aStream.
	aStream << ' finished'
]
