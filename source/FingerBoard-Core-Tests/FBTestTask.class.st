Class {
	#name : #FBTestTask,
	#superclass : #FBTask,
	#category : #'FingerBoard-Core-Tests'
}

{ #category : #'as yet unclassified' }
FBTestTask >> executeIn: aFBExecutor [ 
	super executeIn: aFBExecutor.
	aFBExecutor valueAtNode: self put: self value
]

{ #category : #accessing }
FBTestTask >> value [
	^ 10 atRandom 
]
