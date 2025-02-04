Class {
	#name : 'FBFlowInstanceStarted',
	#superclass : 'FBFlowInstanceEvent',
	#category : 'FingerBoard-Core-Event',
	#package : 'FingerBoard-Core',
	#tag : 'Event'
}

{ #category : 'printing' }
FBFlowInstanceStarted >> message [
	^ 'instance started'
]

{ #category : 'printing' }
FBFlowInstanceStarted >> printOn: aStream [ 
	super printOn: aStream.
	aStream << 'instance started'
]

{ #category : 'accessing' }
FBFlowInstanceStarted >> type [

	^ #instanceStarted
]
