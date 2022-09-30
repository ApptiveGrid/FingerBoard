Class {
	#name : #FBFlowInstanceStarted,
	#superclass : #FBFlowInstanceEvent,
	#category : #'FingerBoard-Core-Event'
}

{ #category : #printing }
FBFlowInstanceStarted >> logTrace [
	^ 'instance started'
]

{ #category : #printing }
FBFlowInstanceStarted >> printOn: aStream [ 
	super printOn: aStream.
	aStream << 'instance started'
]

{ #category : #accessing }
FBFlowInstanceStarted >> type [

	^ #instanceStarted
]
