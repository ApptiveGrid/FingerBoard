Class {
	#name : 'FBUUIDGenerator',
	#superclass : 'FBIdGenerator',
	#category : 'FingerBoard-Core-Base',
	#package : 'FingerBoard-Core',
	#tag : 'Base'
}

{ #category : 'instance creation' }
FBUUIDGenerator >> newId [ 
	^ UUID new asString36.
]
