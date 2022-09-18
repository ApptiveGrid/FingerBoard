Class {
	#name : #FBExclusiveGatewayBehavior,
	#superclass : #FBNodeBehavior,
	#category : #'FingerBoard-Core-Behavior'
}

{ #category : #execution }
FBExclusiveGatewayBehavior >> execute [
	| next |
	next := self outgoing 
		detect: [ :each | each condition value: activation argument ]
		ifNone: [ Error signal: 'conditions do not match' ].
	self followTransition: next
]
