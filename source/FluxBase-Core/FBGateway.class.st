Class {
	#name : 'FBGateway',
	#superclass : 'FBNode',
	#category : 'FluxBase-Core-Model',
	#package : 'FluxBase-Core',
	#tag : 'Model'
}

{ #category : 'testing' }
FBGateway class >> isAbstract [

	^ self == FBGateway
]

{ #category : 'adding' }
FBGateway >> addOutgoingNode: aFBNode withCondition: aCondition [
	^ self addOutgoing: ((self transitionClass source: self target: aFBNode) 
		condition: aCondition).
]
