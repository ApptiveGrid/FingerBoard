Class {
	#name : #FBNodeStringEvent,
	#superclass : #FBNodeActivationEvent,
	#instVars : [
		'description'
	],
	#category : #'FingerBoard-Core-Event'
}

{ #category : #accessing }
FBNodeStringEvent >> description: aString [ 
	description := aString
]

{ #category : #printing }
FBNodeStringEvent >> message [

	^ 'activation in progress ' , description asString
]

{ #category : #printing }
FBNodeStringEvent >> printOn: aStream [ 
	super printOn: aStream.
	aStream << ' in progress: ' << description asString
]

{ #category : #accessing }
FBNodeStringEvent >> type [

	^ #string
]
