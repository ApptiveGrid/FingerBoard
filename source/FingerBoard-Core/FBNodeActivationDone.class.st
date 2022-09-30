Class {
	#name : #FBNodeActivationDone,
	#superclass : #FBNodeActivationEvent,
	#category : #'FingerBoard-Core-Event'
}

{ #category : #accessing }
FBNodeActivationDone >> name [

	^ #activationDone
]

{ #category : #printing }
FBNodeActivationDone >> printOn: aStream [ 
	super printOn: aStream.
	aStream << ' finished'
]
