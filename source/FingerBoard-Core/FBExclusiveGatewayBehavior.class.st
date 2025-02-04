Class {
	#name : 'FBExclusiveGatewayBehavior',
	#superclass : 'FBNodeBehavior',
	#category : 'FingerBoard-Core-Behavior',
	#package : 'FingerBoard-Core',
	#tag : 'Behavior'
}

{ #category : 'execution' }
FBExclusiveGatewayBehavior >> execute [
	activation value: self argument.
	activation done.
	activation followAllOutgoing.
	
]
