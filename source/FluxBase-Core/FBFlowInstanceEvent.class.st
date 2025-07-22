Class {
	#name : 'FBFlowInstanceEvent',
	#superclass : 'FBFlowEvent',
	#instVars : [
		'flowInstance'
	],
	#category : 'FluxBase-Core-Event',
	#package : 'FluxBase-Core',
	#tag : 'Event'
}

{ #category : 'accessing' }
FBFlowInstanceEvent >> flowInstance [

	^ flowInstance
]

{ #category : 'accessing' }
FBFlowInstanceEvent >> flowInstance: anObject [

	flowInstance := anObject
]

{ #category : 'printing' }
FBFlowInstanceEvent >> printOn: aStream [ 
	aStream << flowInstance id asString.
	aStream << ': '
]
