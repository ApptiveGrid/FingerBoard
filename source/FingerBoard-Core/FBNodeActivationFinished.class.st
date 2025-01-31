Class {
	#name : 'FBNodeActivationFinished',
	#superclass : 'FBNodeActivationEvent',
	#category : 'FingerBoard-Core-Event',
	#package : 'FingerBoard-Core',
	#tag : 'Event'
}

{ #category : 'printing' }
FBNodeActivationFinished >> printOn: aStream [ 
	super printOn: aStream.
	aStream << ' finished'
]

{ #category : 'accessing' }
FBNodeActivationFinished >> type [

	^ #activationFinished
]
