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
		ifAbsentPut: [ 
			aFBNode setFlow: self.
			aFBNode ]
	
	 
]

{ #category : #removing }
FBFlow >> basicRemoveNode: aNode [ 
	nodesMap removeKey: aNode id
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

{ #category : #'as yet unclassified' }
FBFlow >> nodeWithId: aString [ 
	^ self 
		nodeWithId: aString  
		ifAbsent: [ FBNodeNotFound signal: 'Node with id ', aString asString, ' not found' ]
]

{ #category : #'as yet unclassified' }
FBFlow >> nodeWithId: aString ifAbsent: aBlock [
	^ nodesMap 
		at: aString 
		ifAbsent: aBlock
]

{ #category : #accessing }
FBFlow >> nodes [
	^ nodesMap values
]

{ #category : #removing }
FBFlow >> removeNode: aNode [ 
	aNode detach.
	self basicRemoveNode: aNode
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

{ #category : #querying }
FBFlow >> transitionWithId: aString [ 
	^ self 
		transitionWithId: aString 
		ifAbsent: [ FBTranstionNotFound signal: 'transition with id ', aString asString, ' not found' ]
]

{ #category : #querying }
FBFlow >> transitionWithId: aString ifAbsent: aBlock [
	nodesMap do: [ :node | 
		node outgoing 
			detect: [ :each | each id = aString ]
			ifFound: [ :transition | ^ transition ] ].
	^ aBlock value
]
