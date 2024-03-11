Class {
	#name : #FBNodeBehavior,
	#superclass : #Object,
	#instVars : [
		'node'
	],
	#category : #'FingerBoard-Core-Behavior'
}

{ #category : #accessing }
FBNodeBehavior class >> metadataSchema [
	^ FBPropertySchema new
]

{ #category : #'as yet unclassified' }
FBNodeBehavior class >> propertySchema [
	^ FBPropertySchema new
]

{ #category : #execution }
FBNodeBehavior >> executeWith: anArgument [
	self subclassResponsibility 
]

{ #category : #initialization }
FBNodeBehavior >> initializeFromActivation: anAGFlowActivation [ 
	self subclassResponsibility 
]

{ #category : #accessing }
FBNodeBehavior >> metadataSchema [
	^ node metadataSchema
]

{ #category : #accessing }
FBNodeBehavior >> node [
	^ node
]

{ #category : #accessing }
FBNodeBehavior >> node: aNode [
	node := aNode
]

{ #category : #accessing }
FBNodeBehavior >> outgoing [
	^ self node outgoing
]

{ #category : #convenience }
FBNodeBehavior >> postProcessActivation: aFlowInstance [ 
	self subclassResponsibility 
]
