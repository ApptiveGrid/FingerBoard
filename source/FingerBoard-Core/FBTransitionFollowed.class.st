Class {
	#name : 'FBTransitionFollowed',
	#superclass : 'FBFlowInstanceEvent',
	#instVars : [
		'transition',
		'value'
	],
	#category : 'FingerBoard-Core-Event',
	#package : 'FingerBoard-Core',
	#tag : 'Event'
}

{ #category : 'printing' }
FBTransitionFollowed >> message [
	^ 'transition followed from ', transition source printString , ' to ' , transition target printString , ' with ' , value printString
]

{ #category : 'printing' }
FBTransitionFollowed >> printOn: aStream [ 
	super printOn: aStream.
	aStream << 'transition followed '.
	transition printOn: aStream.
	aStream << ' with value '.
	value printOn: aStream
]

{ #category : 'accessing' }
FBTransitionFollowed >> transition [

	^ transition
]

{ #category : 'accessing' }
FBTransitionFollowed >> transition: anObject [

	transition := anObject
]

{ #category : 'accessing' }
FBTransitionFollowed >> type [

	^ #transitionFollowed
]

{ #category : 'accessing' }
FBTransitionFollowed >> value [

	^ value
]

{ #category : 'accessing' }
FBTransitionFollowed >> value: anObject [

	value := anObject
]
