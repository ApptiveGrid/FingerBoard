Class {
	#name : #FBNodeActivationDone,
	#superclass : #FBNodeActivationEvent,
	#category : #'FingerBoard-Core-Event'
}

{ #category : #printing }
FBNodeActivationDone >> printOn: aStream [ 
	super printOn: aStream.
	aStream << ' finished'
]
