Class {
	#name : #FBExclusiveGatewayBehavior,
	#superclass : #FBNodeBehavior,
	#category : #'FingerBoard-Core-Behavior'
}

{ #category : #execution }
FBExclusiveGatewayBehavior >> executeWith: anObject [ 
	^ anObject 
]

{ #category : #initialization }
FBExclusiveGatewayBehavior >> initializeFromActivation: anActivation [
]

{ #category : #convenience }
FBExclusiveGatewayBehavior >> postProcessActivation: anActivation [ 
	anActivation 
		done;
		followAll: self outgoing
]
