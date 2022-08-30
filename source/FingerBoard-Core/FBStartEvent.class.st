Class {
	#name : #FBStartEvent,
	#superclass : #FBEvent,
	#category : #'FingerBoard-Core'
}

{ #category : #'instance creation' }
FBStartEvent class >> typeName [

	^ #start
]

{ #category : #visiting }
FBStartEvent >> acceptFingerBoard: aFBVisitor [ 
	^ aFBVisitor visitStartEvent: self 
]

{ #category : #'as yet unclassified' }
FBStartEvent >> evaluateIn: aFBActivation [ 
	aFBActivation followTransition: outgoing first.
	"a start event is an entry event that should pass its argument to 
	the next node"
	aFBActivation value: aFBActivation argument.
]

{ #category : #initialization }
FBStartEvent >> initialize [ 
	super initialize.
	name := 'start'
]
