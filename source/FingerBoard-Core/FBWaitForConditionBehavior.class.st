Class {
	#name : #FBWaitForConditionBehavior,
	#superclass : #FBNodeBehavior,
	#instVars : [
		'proceed'
	],
	#category : #'FingerBoard-Core-Behavior'
}

{ #category : #execution }
FBWaitForConditionBehavior >> execute [ 
	(self node evaluateConditionWith: activation argument)
		ifTrue: [ activation followAll: self node outgoing ]
		ifFalse: [ activation waitForNode: self ]
]

{ #category : #execution }
FBWaitForConditionBehavior >> executeWith: anObject [ 
	proceed := self node evaluateConditionWith: anObject

]

{ #category : #execution }
FBWaitForConditionBehavior >> postProcessActivation: anActivation [  
	proceed
		ifTrue: [ anActivation followAll: self node outgoing ]
		ifFalse: [ anActivation waitForNode: self ]
]
