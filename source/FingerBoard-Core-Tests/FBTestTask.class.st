Class {
	#name : #FBTestTask,
	#superclass : #FBTask,
	#category : #'FingerBoard-Core-Tests'
}

{ #category : #'as yet unclassified' }
FBTestTask >> evaluateIn: aFBActivation [ 
	| value |
	super evaluateIn: aFBActivation.
	value := self value.
	aFBActivation value: value.
	^ value
]

{ #category : #accessing }
FBTestTask >> value [
	^ 10 atRandom 
]
