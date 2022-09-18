Class {
	#name : #FBNodeActivationStarted,
	#superclass : #FBNodeActivationEvent,
	#category : #'FingerBoard-Core-Event'
}

{ #category : #printing }
FBNodeActivationStarted >> printOn: aStream [ 
	super printOn: aStream.
	aStream << ' activated'
]
