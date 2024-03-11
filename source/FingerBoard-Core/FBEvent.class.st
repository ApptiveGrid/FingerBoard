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
FBEvent >> executeWith: anObject [ 

	| behavior |
	behavior := super executeWith: anObject.
	^ behavior
]

{ #category : #'as yet unclassified' }
FBEvent >> postProcessActivation: anActivation [
	anActivation done
]
