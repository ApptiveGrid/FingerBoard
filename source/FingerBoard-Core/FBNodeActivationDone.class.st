Class {
	#name : #FBNodeActivationDone,
	#superclass : #FBNodeActivationEvent,
	#category : #'FingerBoard-Core-Event'
}

{ #category : #printing }
FBNodeActivationDone >> logTrace [

	^ 'activation finished successfully'
]

{ #category : #printing }
FBNodeActivationDone >> printOn: aStream [ 
	super printOn: aStream.
	aStream << ' finished'
]

{ #category : #accessing }
FBNodeActivationDone >> type [

	^ #activationDone
]
