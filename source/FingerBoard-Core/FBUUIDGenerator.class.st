Class {
	#name : #FBUUIDGenerator,
	#superclass : #FBIdGenerator,
	#category : #'FingerBoard-Core-Base'
}

{ #category : #'instance creation' }
FBUUIDGenerator >> newId [ 
	^ UUID new asString36.
]
