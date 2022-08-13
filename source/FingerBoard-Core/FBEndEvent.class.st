Class {
	#name : #FBEndEvent,
	#superclass : #FBEvent,
	#category : #'FingerBoard-Core'
}

{ #category : #'as yet unclassified' }
FBEndEvent >> executeIn: aFBActivation [ 
	aFBActivation done.
	aFBActivation executor completed
]
