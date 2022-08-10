Class {
	#name : #FBEndEvent,
	#superclass : #FBEvent,
	#category : #'FingerBoard-Core'
}

{ #category : #'as yet unclassified' }
FBEndEvent >> executeIn: aFBFlowExecutor [ 
	aFBFlowExecutor completed
]
