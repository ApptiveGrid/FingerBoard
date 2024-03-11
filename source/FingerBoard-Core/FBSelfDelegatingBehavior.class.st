Class {
	#name : #FBSelfDelegatingBehavior,
	#superclass : #FBNodeBehavior,
	#category : #'FingerBoard-Core-Behavior'
}

{ #category : #execution }
FBSelfDelegatingBehavior >> executeWith: anObject [
	^ node executeWith: anObject
]

{ #category : #initialization }
FBSelfDelegatingBehavior >> initializeFromActivation: anActivation [ 
	node initializeFromActivation: anActivation
]

{ #category : #convenience }
FBSelfDelegatingBehavior >> postProcessActivation: anActivation [ 
	node postProcessActivation: anActivation 
]
