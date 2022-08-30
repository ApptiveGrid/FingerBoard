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
FBStartEvent >> executeIn: aFBFlowExecutor [ 
	aFBFlowExecutor addPending: outgoing first target
]
