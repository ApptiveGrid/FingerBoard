Class {
	#name : #FBFlow,
	#superclass : #Object,
	#instVars : [
		'name',
		'start'
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
	start ifNotNil: [ Error signal: 'Cannot find end without a start node being present' ].
	^ start findEnd
]

{ #category : #accessing }
FBFlow >> name [

	^ name
]

{ #category : #accessing }
FBFlow >> name: anObject [

	name := anObject
]

{ #category : #'instance creation' }
FBFlow >> newInstance [
	^ FBFlowInstance new 
		flow: self
]

{ #category : #accessing }
FBFlow >> start [
	^ start ifNil: [ 
		start := FBStartEvent named: #start ]
]

{ #category : #accessing }
FBFlow >> start: aFBStartEvent [ 
	start := aFBStartEvent 
]
