Class {
	#name : 'FBPropertyType',
	#superclass : 'Object',
	#category : 'FingerBoard-Core-Tests',
	#package : 'FingerBoard-Core-Tests'
}

{ #category : 'instance creation' }
FBPropertyType class >> number [
	^ FBPropertyNumberType new 
]

{ #category : 'instance creation' }
FBPropertyType class >> string [
	^ FBPropertyStringType new
]
