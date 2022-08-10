Class {
	#name : #FBActivation,
	#superclass : #Object,
	#instVars : [
		'timestamp',
		'node',
		'value'
	],
	#category : #'FingerBoard-Core'
}

{ #category : #initialization }
FBActivation >> initialize [ 
	super initialize.
	timestamp := DateAndTime now
]

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
