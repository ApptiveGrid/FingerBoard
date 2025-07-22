Class {
	#name : 'FBPropertyStringType',
	#superclass : 'FBPropertyType',
	#category : 'FluxBase-Core-Tests',
	#package : 'FluxBase-Core-Tests'
}

{ #category : 'reading' }
FBPropertyStringType >> read: aString [ 
	^ aString asString
]
