Class {
	#name : 'FBPropertyType',
	#superclass : 'Object',
	#category : 'FluxBase-Core-Tests',
	#package : 'FluxBase-Core-Tests'
}

{ #category : 'instance creation' }
FBPropertyType class >> number [
	^ FBPropertyNumberType new 
]

{ #category : 'instance creation' }
FBPropertyType class >> string [
	^ FBPropertyStringType new
]
