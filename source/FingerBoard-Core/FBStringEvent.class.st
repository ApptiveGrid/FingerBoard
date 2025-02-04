Class {
	#name : 'FBStringEvent',
	#superclass : 'FBFlowEvent',
	#instVars : [
		'description'
	],
	#category : 'FingerBoard-Core-Event',
	#package : 'FingerBoard-Core',
	#tag : 'Event'
}

{ #category : 'accessing' }
FBStringEvent >> description: aString [ 
	description := aString
]

{ #category : 'printing' }
FBStringEvent >> message [

	^  description 
]

{ #category : 'printing' }
FBStringEvent >> printOn: aStream [ 
	super printOn: aStream.
	aStream << description 
]

{ #category : 'accessing' }
FBStringEvent >> type [

	^ #string
]
