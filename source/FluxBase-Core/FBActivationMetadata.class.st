Class {
	#name : 'FBActivationMetadata',
	#superclass : 'FBProperties',
	#instVars : [
		'activation'
	],
	#category : 'FluxBase-Core-Model',
	#package : 'FluxBase-Core',
	#tag : 'Model'
}

{ #category : 'accessing' }
FBActivationMetadata >> activation: aFBActivation [ 
	activation := aFBActivation 
]

{ #category : 'accessing' }
FBActivationMetadata >> previous [
	^ activation previous metadata 
]

{ #category : 'printing' }
FBActivationMetadata >> printOn: aStream [ 
	aStream << 'env: '.
	activation printOn: aStream
]
