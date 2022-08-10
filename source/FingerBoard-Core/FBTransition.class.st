Class {
	#name : #FBTransition,
	#superclass : #Object,
	#instVars : [
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

{ #category : #visiting }
FBTransition >> acceptFingerBoard: aVisitor [ 
	^ aVisitor visitTransition: self
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
