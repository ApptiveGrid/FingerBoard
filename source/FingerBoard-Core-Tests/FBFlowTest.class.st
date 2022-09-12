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
	instance execute.
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
	intermediate remove.
	self assert: flow nodes size equals: 2
]

{ #category : #tests }
FBFlowTest >> testRemoveNodeFlow [
	| flow intermediate |
	flow := self simpleFlow.
	intermediate := flow start outgoing first target.
	flow removeNode: intermediate.
	self assert: flow nodes size equals: 2
]

{ #category : #tests }
FBFlowTest >> testRemoveTransitionWithId [
	| flow transition t |
	flow := self simpleFlow.
	transition := flow start outgoing first.
	self assert: (flow transitionWithId: transition id) equals: transition.
	transition detach.
	t := flow transitionWithId: transition id ifAbsent: nil.
	self assert: t isNil
]

{ #category : #tests }
FBFlowTest >> testTransitionWithId [
	| flow transition |
	flow := self simpleFlow.
	transition := flow start outgoing first.
	self assert: (flow transitionWithId: transition id) equals: transition
]
