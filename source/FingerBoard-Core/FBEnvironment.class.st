Class {
	#name : #FBEnvironment,
	#superclass : #FBProperties,
	#instVars : [
		'activation'
	],
	#category : #'FingerBoard-Core-Model'
}

{ #category : #accessing }
FBEnvironment >> activation: aFBActivation [ 
	activation := aFBActivation 
]

{ #category : #accessing }
FBEnvironment >> previous [
	^ activation previous environment 
]

{ #category : #printing }
FBEnvironment >> printOn: aStream [ 
	aStream << 'env: '.
	activation printOn: aStream
]
