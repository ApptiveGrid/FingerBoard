Class {
	#name : #FBFlow,
	#superclass : #Object,
	#instVars : [
		'name',
		'start',
		'nodesMap'
	],
	#category : #'FingerBoard-Core'
}

{ #category : #visiting }
FBFlow >> acceptFingerBoard: aFBVisitor [ 
	^ aFBVisitor visitFlow: self
]

{ #category : #adding }
FBFlow >> addNode: aFBNode [
	nodesMap 
		at: aFBNode id 
		ifAbsentPut: aFBNode 
]

{ #category : #accessing }
FBFlow >> end [
	start ifNil: [ Error signal: 'Cannot find end without a start node being present' ].
	^ start findEnd
]

{ #category : #initialization }
FBFlow >> initialize [ 
	super initialize.
	nodesMap := OrderedDictionary new
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
FBFlow >> nodes [
	^ nodesMap values
]

{ #category : #accessing }
FBFlow >> start [
	^ start ifNil: [ 
		start := (FBStartEvent named: #start) 
			flow: self;
			yourself ]
]

{ #category : #accessing }
FBFlow >> start: aFBStartEvent [ 
	aFBStartEvent flow: self.
	start := aFBStartEvent 
]
