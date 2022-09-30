Class {
	#name : #FBNodeActivationFinished,
	#superclass : #FBNodeActivationEvent,
	#category : #'FingerBoard-Core-Event'
}

{ #category : #printing }
FBNodeActivationFinished >> printOn: aStream [ 
	super printOn: aStream.
	aStream << ' finished'
]

{ #category : #accessing }
FBNodeActivationFinished >> type [

	^ #activationFinished
]
