Class {
	#name : #FBTask,
	#superclass : #FBActivity,
	#category : #'FingerBoard-Core'
}

{ #category : #'as yet unclassified' }
FBTask >> executeIn: aFBActivation [ 
	aFBActivation followTransition: outgoing first.

]
