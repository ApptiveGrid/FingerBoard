Class {
	#name : #FBNodeActivationFinished,
	#superclass : #FBNodeActivationEvent,
	#category : #'FingerBoard-Core-Event'
}

{ #category : #accessing }
FBNodeActivationFinished >> name [

	^ #activationFinished
]

{ #category : #printing }
FBNodeActivationFinished >> printOn: aStream [ 
	super printOn: aStream.
	aStream << ' finished'
]
