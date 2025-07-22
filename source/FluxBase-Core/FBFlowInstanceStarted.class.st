Class {
	#name : 'FBFlowInstanceStarted',
	#superclass : 'FBFlowInstanceEvent',
	#category : 'FluxBase-Core-Event',
	#package : 'FluxBase-Core',
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
