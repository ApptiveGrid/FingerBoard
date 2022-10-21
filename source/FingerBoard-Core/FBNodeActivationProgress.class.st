Class {
	#name : #FBNodeActivationProgress,
	#superclass : #FBNodeActivationEvent,
	#instVars : [
		'description'
	],
	#category : #'FingerBoard-Core-Event'
}

{ #category : #accessing }
FBNodeActivationProgress >> description: aString [ 
	description := aString
]

{ #category : #printing }
FBNodeActivationProgress >> message [

	^ 'activation in progress ' , description asString
]

{ #category : #printing }
FBNodeActivationProgress >> printOn: aStream [ 
	super printOn: aStream.
	aStream << ' in progress: ' << description asString
]

{ #category : #accessing }
FBNodeActivationProgress >> type [

	^ #activationProgress
]
