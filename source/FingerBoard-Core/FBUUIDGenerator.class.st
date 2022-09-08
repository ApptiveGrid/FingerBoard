Class {
	#name : #FBUUIDGenerator,
	#superclass : #FBIdGenerator,
	#category : #'FingerBoard-Core'
}

{ #category : #'instance creation' }
FBUUIDGenerator >> newId [ 
	^ UUID new asString36.
]
