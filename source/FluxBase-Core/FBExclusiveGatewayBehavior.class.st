Class {
	#name : 'FBExclusiveGatewayBehavior',
	#superclass : 'FBNodeBehavior',
	#category : 'FluxBase-Core-Behavior',
	#package : 'FluxBase-Core',
	#tag : 'Behavior'
}

{ #category : 'execution' }
FBExclusiveGatewayBehavior >> execute [
	activation value: self argument.
	activation done.
	activation followAllOutgoing.
	
]
