Class {
	#name : #FBNodeBehavior,
	#superclass : #Object,
	#instVars : [
		'activation'
	],
	#category : #'FingerBoard-Core-Behavior'
}

{ #category : #accessing }
FBNodeBehavior class >> environmentSchema [
	^ FBPropertySchema new
]

{ #category : #'as yet unclassified' }
FBNodeBehavior class >> propertySchema [
	^ FBPropertySchema new
]

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

{ #category : #accessing }
FBNodeBehavior >> environment [
	^ activation environment
]

{ #category : #accessing }
FBNodeBehavior >> environmentSchema [
	^ activation environmentSchema
]

{ #category : #execution }
FBNodeBehavior >> execute [ 
	self subclassResponsibility 
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
