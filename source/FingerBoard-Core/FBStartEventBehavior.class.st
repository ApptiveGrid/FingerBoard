Class {
	#name : #FBStartEventBehavior,
	#superclass : #FBNodeBehavior,
	#category : #'FingerBoard-Core-Behavior'
}

{ #category : #execution }
FBStartEventBehavior >> execute [

	"a start event is an entry event that should pass its argument to 
	the next node"

	self value: self argument.
	self outgoing do: [ :each | "start node should only have maximum 1 ougoing node" 
		self followTransition: each ]
]

{ #category : #execution }
FBStartEventBehavior >> executeWith: anObject [ 

	"a start event is an entry event that should pass its argument to 
	the next node"

	^ anObject 
]

{ #category : #initialization }
FBStartEventBehavior >> initializeFromActivation: anActivation [ 
	
]

{ #category : #convenience }
FBStartEventBehavior >> postProcessActivation: anActivation [ 
	anActivation 
		done;
		followAll: self outgoing
]

{ #category : #'as yet unclassified' }
FBStartEventBehavior >> prepareBehavior [ 
]
