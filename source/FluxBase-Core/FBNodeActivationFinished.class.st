Class {
	#name : 'FBNodeActivationFinished',
	#superclass : 'FBNodeActivationEvent',
	#category : 'FluxBase-Core-Event',
	#package : 'FluxBase-Core',
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
