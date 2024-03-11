Class {
	#name : #FBTaskBehavior,
	#superclass : #FBNodeBehavior,
	#category : #'FingerBoard-Core-Behavior'
}

{ #category : #execution }
FBTaskBehavior >> executeWith: anObject [
	^ self node value
	
]

{ #category : #initialization }
FBTaskBehavior >> initializeFromActivation: anAGFlowActivation [ 
	
]

{ #category : #convenience }
FBTaskBehavior >> postProcessActivation: anActivation [ 
	anActivation 
		done;
		followAll: self outgoing
]
