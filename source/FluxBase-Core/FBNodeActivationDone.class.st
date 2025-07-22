Class {
	#name : 'FBNodeActivationDone',
	#superclass : 'FBNodeActivationEvent',
	#category : 'FluxBase-Core-Event',
	#package : 'FluxBase-Core',
	#tag : 'Event'
}

{ #category : 'printing' }
FBNodeActivationDone >> message [

	^ 'activation finished successfully'
]

{ #category : 'printing' }
FBNodeActivationDone >> printOn: aStream [ 
	super printOn: aStream.
	aStream << ' finished'
]

{ #category : 'accessing' }
FBNodeActivationDone >> type [

	^ #activationDone
]
