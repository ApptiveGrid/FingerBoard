Class {
	#name : 'FBUUIDGenerator',
	#superclass : 'FBIdGenerator',
	#category : 'FluxBase-Core-Base',
	#package : 'FluxBase-Core',
	#tag : 'Base'
}

{ #category : 'instance creation' }
FBUUIDGenerator >> newId [ 
	^ UUID new asString36.
]
