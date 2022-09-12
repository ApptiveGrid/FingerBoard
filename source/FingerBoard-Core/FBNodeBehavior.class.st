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

{ #category : #accessing }
FBNodeBehavior >> argument [
	^ activation argument
]

{ #category : #finalization }
FBNodeBehavior >> executor [ 
	^ activation executor
]

{ #category : #moving }
FBNodeBehavior >> followTransition: aFBTransition [ 
	activation followTransition: aFBTransition 
]

{ #category : #accessing }
FBNodeBehavior >> node [
	^ activation node
]

{ #category : #accessing }
FBNodeBehavior >> outgoing [
	^ self node outgoing
]

{ #category : #accessing }
FBNodeBehavior >> value: anObject [
	activation value: anObject
]
