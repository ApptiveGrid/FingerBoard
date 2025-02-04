Class {
	#name : 'FBActivationMetadata',
	#superclass : 'FBProperties',
	#instVars : [
		'activation'
	],
	#category : 'FingerBoard-Core-Model',
	#package : 'FingerBoard-Core',
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
