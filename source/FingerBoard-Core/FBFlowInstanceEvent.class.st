Class {
	#name : 'FBFlowInstanceEvent',
	#superclass : 'FBFlowEvent',
	#instVars : [
		'flowInstance'
	],
	#category : 'FingerBoard-Core-Event',
	#package : 'FingerBoard-Core',
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
