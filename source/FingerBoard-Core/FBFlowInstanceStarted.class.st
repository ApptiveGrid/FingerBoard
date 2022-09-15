Class {
	#name : #FBFlowInstanceStarted,
	#superclass : #FBFlowInstanceEvent,
	#category : #'FingerBoard-Core'
}

{ #category : #printing }
FBFlowInstanceStarted >> printOn: aStream [ 
	super printOn: aStream.
	aStream << 'instance started'
]
