Class {
	#name : #FBFlowTest,
	#superclass : #FBTest,
	#category : #'FingerBoard-Core-Tests'
}

{ #category : #tests }
FBFlowTest >> testAllNodes [ 
	| flow |
	flow := AGFlow simpleFlow. 
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
	instance := AGFlow gatewayedFlow newInstance.
	instance execute.
	self assert: instance atEnd 
]

{ #category : #tests }
FBFlowTest >> testExecuteSimpleFlow [ 
	| instance |
	instance := AGFlow simpleFlow newInstance.
	instance execute.
	self assert: instance atEnd 
]

{ #category : #tests }
FBFlowTest >> testFlowWithCycle [
	
	self 
		should: [ AGFlow withCycle ]
		raise: FBFlowIsCyclic 
	
]

{ #category : #tests }
FBFlowTest >> testIsCyclic [ 
	| flow |
	flow := AGFlow withCycleForce.
	self
		should: [ flow validate ]
		raise: FBFlowIsCyclic  
]

{ #category : #tests }
FBFlowTest >> testIsNotCyclic [ 
	| flow |
	flow := AGFlow complex.
	self
		shouldnt: [ flow validate ]
		raise: FBFlowIsCyclic  
]

{ #category : #tests }
FBFlowTest >> testNodeWithId [
	| flow id |
	flow := AGFlow simpleFlow.
	id := flow start id.
	self assert: (flow nodeWithId: id) equals: flow start
]

{ #category : #tests }
FBFlowTest >> testNodeWithIdError [
	| flow |
	flow := AGFlow simpleFlow.
	self 
		should: [ flow nodeWithId: #bogus ]
		raise: FBNodeNotFound 
]

{ #category : #tests }
FBFlowTest >> testRemoveNode [
	| flow intermediate |
	flow := AGFlow simpleFlow.
	intermediate := flow start outgoing first target.
	intermediate remove.
	self assert: flow nodes size equals: 2
]

{ #category : #tests }
FBFlowTest >> testRemoveNodeFlow [
	| flow intermediate |
	flow := AGFlow simpleFlow.
	intermediate := flow start outgoing first target.
	flow removeNode: intermediate.
	self assert: flow nodes size equals: 2
]

{ #category : #tests }
FBFlowTest >> testRemoveTransitionWithId [
	| flow transition t |
	flow := AGFlow simpleFlow.
	transition := flow start outgoing first.
	self assert: (flow transitionWithId: transition id) equals: transition.
	transition detach.
	t := flow transitionWithId: transition id ifAbsent: nil.
	self assert: t isNil
]

{ #category : #tests }
FBFlowTest >> testTransitionWithId [
	| flow transition |
	flow := AGFlow simpleFlow.
	transition := flow start outgoing first.
	self assert: (flow transitionWithId: transition id) equals: transition
]
