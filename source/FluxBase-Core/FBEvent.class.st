Class {
	#name : 'FBEvent',
	#superclass : 'FBNode',
	#category : 'FluxBase-Core-Model',
	#package : 'FluxBase-Core',
	#tag : 'Model'
}

{ #category : 'testing' }
FBEvent class >> isAbstract [

	^ self == FBEvent
]

{ #category : 'instance creation' }
FBEvent >> activateWith: aFBActivation [

	super activateWith: aFBActivation.
	aFBActivation done
]
