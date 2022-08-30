Class {
	#name : #FBGateway,
	#superclass : #FBNode,
	#category : #'FingerBoard-Core'
}

{ #category : #testing }
FBGateway class >> isAbstract [

	^ self == FBGateway
]

{ #category : #adding }
FBGateway >> addOutgoingNode: aFBNode withCondition: aCondition [
	^ self addOutgoing: ((FBConditionalTransition source: self target: aFBNode) 
		condition: aCondition).
]
