Class {
	#name : #FBFlowInstanceStarted,
	#superclass : #FBFlowInstanceEvent,
	#category : #'FingerBoard-Core-Event'
}

{ #category : #accessing }
FBFlowInstanceStarted >> name [

	^ #instanceStarted
]

{ #category : #printing }
FBFlowInstanceStarted >> printOn: aStream [ 
	super printOn: aStream.
	aStream << 'instance started'
]
