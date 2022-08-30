Class {
	#name : #FBEndEvent,
	#superclass : #FBEvent,
	#category : #'FingerBoard-Core'
}

{ #category : #'instance creation' }
FBEndEvent class >> typeName [

	^ #end
]

{ #category : #'as yet unclassified' }
FBEndEvent >> executeIn: aFBActivation [ 
	aFBActivation done.
	aFBActivation executor completed
]
