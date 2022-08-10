Class {
	#name : #FBActivation,
	#superclass : #Object,
	#instVars : [
		'node',
		'value'
	],
	#category : #'FingerBoard-Core'
}

{ #category : #accessing }
FBActivation >> node: aFBNode [
	node := aFBNode
]

{ #category : #accessing }
FBActivation >> value [

	^ value
]

{ #category : #accessing }
FBActivation >> value: anObject [

	value := anObject
]
