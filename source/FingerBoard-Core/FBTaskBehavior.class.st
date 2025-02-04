Class {
	#name : 'FBTaskBehavior',
	#superclass : 'FBNodeBehavior',
	#category : 'FingerBoard-Core-Behavior',
	#package : 'FingerBoard-Core',
	#tag : 'Behavior'
}

{ #category : 'execution' }
FBTaskBehavior >> execute [ 
	activation value: self node value.
	activation done.
	activation followAll: self outgoing.
	
]
