Class {
	#name : 'FBStartEventBehavior',
	#superclass : 'FBNodeBehavior',
	#category : 'FluxBase-Core-Behavior',
	#package : 'FluxBase-Core',
	#tag : 'Behavior'
}

{ #category : 'execution' }
FBStartEventBehavior >> execute [

	"a start event is an entry event that should pass its argument to 
	the next node"

	self value: self argument.
	self outgoing do: [ :each | "start node should only have maximum 1 ougoing node" 
		self followTransition: each ]
]
