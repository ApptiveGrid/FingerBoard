Class {
	#name : #FBFlowTest,
	#superclass : #FBTest,
	#category : #'FingerBoard-Core-Tests'
}

{ #category : #tests }
FBFlowTest >> testAllNodes [ 
	| flow |
	flow := self simpleFlow. 
	self assert: flow nodes size equals: 3.
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
	self assert: flow nodes size equals: 3.

]

{ #category : #tests }
FBFlowTest >> testCreateFlowEarlyStart [
	| start end intermediate flow |
	start := FBStartEvent new.
	flow := FBFlow new 
		start: start.
	intermediate := FBNode new.
	end := intermediate addOutgoingNode: FBEndEvent new.
	start addOutgoingNode: intermediate.
	
	self assert: flow end equals: end.
	self assert: flow nodes size equals: 3.

]

{ #category : #tests }
FBFlowTest >> testExecuteGatewayedFlow [ 
	| instance |
	instance := self gatewayedFlow newInstance.
	instance executeWith: 7.
	self assert: instance atEnd 
]

{ #category : #tests }
FBFlowTest >> testExecuteSimpleFlow [ 
	| instance |
	instance := self simpleFlow newInstance.
	instance execute.
	self assert: instance atEnd 
]

{ #category : #tests }
FBFlowTest >> testNodeWithId [
	| flow id |
	flow := self simpleFlow.
	id := flow start id.
	self assert: (flow nodeWithId: id) equals: flow start
]

{ #category : #tests }
FBFlowTest >> testNodeWithIdError [
	| flow |
	flow := self simpleFlow.
	self 
		should: [ flow nodeWithId: #bogus ]
		raise: FBNodeNotFound 
]

{ #category : #tests }
FBFlowTest >> testRemoveNode [
	| flow intermediate |
	flow := self simpleFlow.
	intermediate := flow start outgoing first target.
	flow removeNode: intermediate.
	self assert: flow nodes size equals: 2
]
