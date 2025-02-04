Class {
	#name : 'FBWaitForConditionBehavior',
	#superclass : 'FBNodeBehavior',
	#category : 'FingerBoard-Core-Behavior',
	#package : 'FingerBoard-Core',
	#tag : 'Behavior'
}

{ #category : 'execution' }
FBWaitForConditionBehavior >> execute [ 
	(self node evaluateConditionWith: activation argument)
		ifTrue: [ activation followAll: self node outgoing ]
		ifFalse: [ .activation waitForNode: self ]
]
