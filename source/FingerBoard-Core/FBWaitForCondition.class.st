Class {
	#name : #FBWaitForCondition,
	#superclass : #FBWait,
	#instVars : [
		'condition'
	],
	#category : #'FingerBoard-Core'
}

{ #category : #accessing }
FBWaitForCondition >> condition: aBlock [
	condition := aBlock 
]

{ #category : #'as yet unclassified' }
FBWaitForCondition >> evaluateIn: aFBActivation [
	(condition value: aFBActivation argument)
		ifTrue: [ aFBActivation followTransition: outgoing first ]
		ifFalse: [ aFBActivation waitForNode: self ]
]

{ #category : #'as yet unclassified' }
FBWaitForCondition >> postProcessIn: aFBActivation [ 
	"we do not automatically follow the flow is we might have to wait"
]
