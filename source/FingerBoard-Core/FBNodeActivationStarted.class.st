Class {
	#name : 'FBNodeActivationStarted',
	#superclass : 'FBNodeActivationEvent',
	#category : 'FingerBoard-Core-Event',
	#package : 'FingerBoard-Core',
	#tag : 'Event'
}

{ #category : 'printing' }
FBNodeActivationStarted >> message [

	^ 'activation started'
]

{ #category : 'printing' }
FBNodeActivationStarted >> printOn: aStream [ 
	super printOn: aStream.
	aStream << ' activated'
]

{ #category : 'accessing' }
FBNodeActivationStarted >> type [

	^ #activationStarted
]
