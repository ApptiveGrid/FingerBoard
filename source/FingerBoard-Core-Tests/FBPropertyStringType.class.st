Class {
	#name : 'FBPropertyStringType',
	#superclass : 'FBPropertyType',
	#category : 'FingerBoard-Core-Tests',
	#package : 'FingerBoard-Core-Tests'
}

{ #category : 'reading' }
FBPropertyStringType >> read: aString [ 
	^ aString asString
]
