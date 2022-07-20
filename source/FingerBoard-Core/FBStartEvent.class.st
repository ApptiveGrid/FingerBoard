Class {
	#name : #FBStartEvent,
	#superclass : #FBEvent,
	#category : #'FingerBoard-Core'
}

{ #category : #visiting }
FBStartEvent >> acceptFingerBoard: aFBVisitor [ 
	^ aFBVisitor visitStartEvent: self 
]
