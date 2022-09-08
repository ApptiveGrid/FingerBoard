Class {
	#name : #FBNodeBehavior,
	#superclass : #Object,
	#instVars : [
		'activation'
	],
	#category : #'FingerBoard-Core'
}

{ #category : #accessing }
FBNodeBehavior >> activation [

	^ activation
]

{ #category : #accessing }
FBNodeBehavior >> activation: anObject [

	activation := anObject
]

{ #category : #execute }
FBNodeBehavior >> execute [
	^ self node evaluateIn: activation 
]

{ #category : #accessing }
FBNodeBehavior >> node [
	^ activation node
]
