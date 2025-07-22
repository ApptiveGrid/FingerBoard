Class {
	#name : 'FBNodeActivationStarted',
	#superclass : 'FBNodeActivationEvent',
	#category : 'FluxBase-Core-Event',
	#package : 'FluxBase-Core',
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
