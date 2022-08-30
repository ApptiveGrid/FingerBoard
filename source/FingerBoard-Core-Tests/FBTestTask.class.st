Class {
	#name : #FBTestTask,
	#superclass : #FBTask,
	#category : #'FingerBoard-Core-Tests'
}

{ #category : #'as yet unclassified' }
FBTestTask >> runIn: aFBActivation [ 
	| value |
	super runIn: aFBActivation.
	value := self value.
	aFBActivation value: value.
	aFBActivation done.
	^ value
]

{ #category : #accessing }
FBTestTask >> value [
	^ 10 atRandom 
]
