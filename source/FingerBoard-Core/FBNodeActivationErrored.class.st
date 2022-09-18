Class {
	#name : #FBNodeActivationErrored,
	#superclass : #FBNodeActivationEvent,
	#instVars : [
		'activationError'
	],
	#category : #'FingerBoard-Core-Event'
}

{ #category : #accessing }
FBNodeActivationErrored >> activationError: aString [ 
	activationError := aString
]

{ #category : #printing }
FBNodeActivationErrored >> printOn: aStream [ 
	super printOn: aStream.
	aStream << ' error: ' << activationError asString
]
