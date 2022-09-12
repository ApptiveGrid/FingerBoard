Class {
	#name : #FBWaitForConditionBehavior,
	#superclass : #FBNodeBehavior,
	#category : #'FingerBoard-Core'
}

{ #category : #execution }
FBWaitForConditionBehavior >> execute [ 
	(self node evaluateConditionWith: activation argument)
		ifTrue: [ activation followAll: self node outgoing ]
		ifFalse: [ activation waitForNode: self ]
]
