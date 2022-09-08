Class {
	#name : #FBTask,
	#superclass : #FBActivity,
	#category : #'FingerBoard-Core'
}

{ #category : #accessing }
FBTask >> behaviorClass [
	^ FBTaskBehavior
]

{ #category : #'as yet unclassified' }
FBTask >> evaluateIn: aFBActivation [ 
	aFBActivation followAll: outgoing.
	
]
