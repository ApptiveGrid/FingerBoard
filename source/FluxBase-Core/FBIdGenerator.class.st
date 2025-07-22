Class {
	#name : 'FBIdGenerator',
	#superclass : 'Object',
	#classVars : [
		'current'
	],
	#category : 'FluxBase-Core-Base',
	#package : 'FluxBase-Core',
	#tag : 'Base'
}

{ #category : 'accessing' }
FBIdGenerator class >> current [ 
	^ current ifNil: [  
		current := self newCurrentInstance ]
]

{ #category : 'accessing' }
FBIdGenerator class >> current: anIdGenerator [
	
	current := anIdGenerator 
]

{ #category : 'accessing' }
FBIdGenerator class >> newCurrentInstance [
	^ FBUUIDGenerator new
]

{ #category : 'as yet unclassified' }
FBIdGenerator >> enableSingleton [ 
	self class current: self
]

{ #category : 'instance creation' }
FBIdGenerator >> newId [ 
	self subclassResponsibility 
]
