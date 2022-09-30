Class {
	#name : #FBNodeActivationStarted,
	#superclass : #FBNodeActivationEvent,
	#category : #'FingerBoard-Core-Event'
}

{ #category : #accessing }
FBNodeActivationStarted >> name [

	^ #activationStarted
]

{ #category : #printing }
FBNodeActivationStarted >> printOn: aStream [ 
	super printOn: aStream.
	aStream << ' activated'
]
