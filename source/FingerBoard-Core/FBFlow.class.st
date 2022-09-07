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
	^ nodesMap 
		at: aString 
		ifAbsent: [ FBNodeNotFound signal: 'Node with id ', aString asString, ' not found' ]
]

{ #category : #accessing }
FBFlow >> nodes [
	^ nodesMap values
]

{ #category : #removing }
FBFlow >> removeNode: aNode [ 
	nodesMap removeKey: aNode id
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
