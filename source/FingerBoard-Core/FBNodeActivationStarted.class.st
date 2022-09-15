Class {
	#name : #FBNodeActivationStarted,
	#superclass : #FBNodeActivationEvent,
	#category : #'FingerBoard-Core'
}

{ #category : #printing }
FBNodeActivationStarted >> printOn: aStream [ 
	super printOn: aStream.
	aStream << ' activated'
]
