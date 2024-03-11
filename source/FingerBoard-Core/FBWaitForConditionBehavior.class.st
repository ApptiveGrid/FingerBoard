Class {
	#name : #FBWaitForConditionBehavior,
	#superclass : #FBNodeBehavior,
	#instVars : [
		'proceed'
	],
	#category : #'FingerBoard-Core-Behavior'
}

{ #category : #execution }
FBWaitForConditionBehavior >> executeWith: anObject [ 
	proceed := self node evaluateConditionWith: anObject

]

{ #category : #initialization }
FBWaitForConditionBehavior >> initializeFromActivation: anActivation [ 
	
]

{ #category : #execution }
FBWaitForConditionBehavior >> postProcessActivation: anActivation [  
	proceed
		ifTrue: [ anActivation followAll: self node outgoing ]
		ifFalse: [ anActivation waitForNode: self ]
]
