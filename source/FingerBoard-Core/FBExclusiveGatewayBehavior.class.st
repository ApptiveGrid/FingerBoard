Class {
	#name : #FBExclusiveGatewayBehavior,
	#superclass : #FBNodeBehavior,
	#category : #'FingerBoard-Core-Behavior'
}

{ #category : #execution }
FBExclusiveGatewayBehavior >> execute [
	activation value: self argument.
	activation followAllOutgoing 
]
