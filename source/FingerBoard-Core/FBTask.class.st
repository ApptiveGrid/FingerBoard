Class {
	#name : #FBTask,
	#superclass : #FBActivity,
	#category : #'FingerBoard-Core'
}

{ #category : #'as yet unclassified' }
FBTask >> evaluateIn: aFBActivation [ 
	aFBActivation followAll: outgoing.
	
]
