Class {
	#name : #FBGateway,
	#superclass : #FBNode,
	#category : #'FingerBoard-Core'
}

{ #category : #adding }
FBGateway >> addOutgoingNode: aFBNode withCondition: aCondition [
	^ self addOutgoing: ((FBConditionalTransition source: self target: aFBNode) 
		condition: aCondition).
]
