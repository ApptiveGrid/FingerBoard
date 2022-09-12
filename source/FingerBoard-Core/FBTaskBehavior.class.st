Class {
	#name : #FBTaskBehavior,
	#superclass : #FBNodeBehavior,
	#category : #'FingerBoard-Core'
}

{ #category : #execution }
FBTaskBehavior >> execute [ 
	activation followAll: self outgoing.
	activation value: self node value
	
]
