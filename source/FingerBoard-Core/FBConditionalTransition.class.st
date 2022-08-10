Class {
	#name : #FBConditionalTransition,
	#superclass : #FBTransition,
	#instVars : [
		'condition'
	],
	#category : #'FingerBoard-Core'
}

{ #category : #accessing }
FBConditionalTransition >> condition [
	^ condition
]

{ #category : #accessing }
FBConditionalTransition >> condition: anObject [

	condition := anObject
]
