Class {
	#name : #FBTestTask,
	#superclass : #FBTask,
	#category : #'FingerBoard-Core-Tests'
}

{ #category : #'as yet unclassified' }
FBTestTask >> executeIn: aFBActivation [ 
	| value |
	super executeIn: aFBActivation.
	value := self value.
	aFBActivation value: value.
	^ value
]

{ #category : #accessing }
FBTestTask >> value [
	^ 10 atRandom 
]
