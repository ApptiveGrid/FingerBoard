Class {
	#name : #FBFlowTest,
	#superclass : #FBTest,
	#category : #'FingerBoard-Core-Tests'
}

{ #category : #tests }
FBFlowTest >> testAllNodes [ 
	| flow |
	flow := self simpleFlow. 
	self assert: flow allNodes size equals: 3.
	self assert: flow end class equals: FBEndEvent 
]

{ #category : #tests }
FBFlowTest >> testCreateFlow [ 
	| start end intermediate flow |
	start := FBStartEvent new.
	intermediate := start addOutgoingNode: FBNode new.
	end := intermediate addOutgoingNode: FBEndEvent new.
	flow := FBFlow new 
		start: start.
	self assert: flow end equals: end.

]

{ #category : #tests }
FBFlowTest >> testExecuteGatewayedFlow [ 
	| instance |
	instance := self gatewayedFlow newInstance.
	instance executeWith: 7.
	instance inspect.
	self assert: instance atEnd 
]

{ #category : #tests }
FBFlowTest >> testExecuteSimpleFlow [ 
	| instance |
	instance := self simpleFlow newInstance.
	instance execute.
	self assert: instance atEnd 
]
