Class {
	#name : #FBTaskBehavior,
	#superclass : #FBNodeBehavior,
	#category : #'FingerBoard-Core-Behavior'
}

{ #category : #execution }
FBTaskBehavior >> execute [ 
	activation value: self node value.
	activation followAll: self outgoing.
	
]
