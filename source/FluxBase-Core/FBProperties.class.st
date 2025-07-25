Class {
	#name : 'FBProperties',
	#superclass : 'Object',
	#instVars : [
		'dictionary',
		'schema'
	],
	#category : 'FluxBase-Core-Model',
	#package : 'FluxBase-Core',
	#tag : 'Model'
}

{ #category : 'accessing' }
FBProperties >> at: key [ 
	^ dictionary at: key
]

{ #category : 'accessing' }
FBProperties >> at: key ifAbsent: aBlock [

	^ dictionary at: key ifAbsent: aBlock
]

{ #category : 'accessing' }
FBProperties >> at: key ifPresent: aBlock [

	^ dictionary at: key ifPresent: aBlock
]

{ #category : 'accessing' }
FBProperties >> at: key put: anObject [
	dictionary 
		at: key
		put: (schema 
			ifNotNil: [ 
				schema 
					at: key
					ifPresent: [:s| s read: anObject ]
					ifAbsent: [ anObject ] ]
			ifNil: [ anObject ])
]

{ #category : 'initialization' }
FBProperties >> initialize [ 
	super initialize.
	dictionary := OrderedDictionary new.
]

{ #category : 'printing' }
FBProperties >> printOn: aStream [ 
	aStream << 'properties: '.
	dictionary printOn: aStream
]

{ #category : 'accessing' }
FBProperties >> schema [

	^ schema
]

{ #category : 'accessing' }
FBProperties >> schema: anObject [

	schema := anObject
]
