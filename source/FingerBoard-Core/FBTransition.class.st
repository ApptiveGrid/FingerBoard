Class {
	#name : #FBTransition,
	#superclass : #Object,
	#instVars : [
		'id',
		'source',
		'target'
	],
	#category : #'FingerBoard-Core'
}

{ #category : #'instance creation' }
FBTransition class >> source: aSourceNode target: aTargetNode [ 
	^ self new 
		source: aSourceNode;
		target: aTargetNode
]

{ #category : #associating }
FBTransition >> --> aNode [ 
	^ target --> aNode
]

{ #category : #visiting }
FBTransition >> acceptFingerBoard: aVisitor [ 
	^ aVisitor visitTransition: self
]

{ #category : #adding }
FBTransition >> addTo: aFBNode [
	source := aFBNode.
	aFBNode addOutgoing: self.
	^ target
]

{ #category : #'as yet unclassified' }
FBTransition >> detach [ 
	source removeOutgoing: self.
	target removeIncoming: self.
]

{ #category : #accessing }
FBTransition >> id [

	^ id
]

{ #category : #accessing }
FBTransition >> id: anObject [

	id := anObject
]

{ #category : #initialization }
FBTransition >> initialize [ 
	super initialize.
	id := UUID new asString36.
]

{ #category : #printing }
FBTransition >> printOn: aStream [ 
	source printOn: aStream.
	aStream << ' --> '.
	target printOn: aStream
]

{ #category : #accessing }
FBTransition >> source [
	^ source
]

{ #category : #accessing }
FBTransition >> source: aFBNode [
	source := aFBNode
]

{ #category : #accessing }
FBTransition >> target [
	^ target
]

{ #category : #accessing }
FBTransition >> target: aFBNode [ 
	target := aFBNode
]
