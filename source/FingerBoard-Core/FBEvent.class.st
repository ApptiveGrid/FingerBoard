Class {
	#name : #FBEvent,
	#superclass : #FBNode,
	#category : #'FingerBoard-Core'
}

{ #category : #testing }
FBEvent class >> isAbstract [

	^ self == FBEvent
]
