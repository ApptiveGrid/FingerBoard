Class {
	#name : #FBStartEventBehavior,
	#superclass : #FBNodeBehavior,
	#category : #'FingerBoard-Core'
}

{ #category : #execution }
FBStartEventBehavior >> execute [ 
	self followTransition: self outgoing first.
	"a start event is an entry event that should pass its argument to 
	the next node"
	self value: self argument
]
