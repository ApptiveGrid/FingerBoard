Class {
	#name : #FBEvent,
	#superclass : #FBNode,
	#category : #'FingerBoard-Core-Model'
}

{ #category : #testing }
FBEvent class >> isAbstract [

	^ self == FBEvent
]

{ #category : #'instance creation' }
FBEvent >> activateWith: aFBActivation [

	aFBActivation done
]
