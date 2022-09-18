Class {
	#name : #FBNodeActivationEvent,
	#superclass : #FBFlowInstanceEvent,
	#instVars : [
		'activation'
	],
	#category : #'FingerBoard-Core-Event'
}

{ #category : #accessing }
FBNodeActivationEvent >> activation [

	^ activation
]

{ #category : #accessing }
FBNodeActivationEvent >> activation: anObject [

	activation := anObject
]

{ #category : #printing }
FBNodeActivationEvent >> printOn: aStream [ 
	super printOn: aStream.
	activation node printOn: aStream.
]
