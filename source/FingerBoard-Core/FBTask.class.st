Class {
	#name : #FBTask,
	#superclass : #FBActivity,
	#category : #'FingerBoard-Core'
}

{ #category : #'as yet unclassified' }
FBTask >> executeIn: aFBFlowExecutor [ 
	aFBFlowExecutor addPending: outgoing first target
]
