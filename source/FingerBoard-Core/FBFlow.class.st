Class {
	#name : #FBFlow,
	#superclass : #Object,
	#instVars : [
		'start',
		'end'
	],
	#category : #'FingerBoard-Core'
}

{ #category : #visiting }
FBFlow >> acceptFingerBoard: aFBVisitor [ 
	^ aFBVisitor visitFlow: self
]

{ #category : #helpers }
FBFlow >> allNodes [
	^ FBCollectNodesVisitor new 
		visit: self;
		nodes
]

{ #category : #accessing }
FBFlow >> end [
	^ end ifNil: [ 
		end := start findEnd ]
]

{ #category : #accessing }
FBFlow >> start [
	^ start
]

{ #category : #accessing }
FBFlow >> start: aFBStartEvent [ 
	start := aFBStartEvent 
]
