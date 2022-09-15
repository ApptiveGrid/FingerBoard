Class {
	#name : #FBTaskBehavior,
	#superclass : #FBNodeBehavior,
	#category : #'FingerBoard-Core'
}

{ #category : #execution }
FBTaskBehavior >> execute [ 
	activation value: self node value.
	activation followAll: self outgoing.
	
]
