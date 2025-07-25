Class {
	#name : 'FBFlowTest',
	#superclass : 'FBTest',
	#category : 'FluxBase-Core-Tests',
	#package : 'FluxBase-Core-Tests'
}

{ #category : 'tests' }
FBFlowTest >> testAllNodes [ 
	| flow |
	flow := FBFlow simpleFlow. 
	self assert: flow nodes size equals: 3.
	self assert: flow end class equals: FBEndEvent 
]

{ #category : 'tests' }
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

{ #category : 'tests' }
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

{ #category : 'tests' }
FBFlowTest >> testEndNodeManyIncoming [
	| flow |
	flow := FBFlow simpleFlow.
	self 
		shouldnt: [ flow end addIncomingNode: FBNode new ]
		raise: FBCannotAddTransition 
]

{ #category : 'tests' }
FBFlowTest >> testEndNodeNoOutgoing [
	| flow |
	flow := FBFlow simpleFlow.
	self 
		should: [ flow end addOutgoingNode: FBNode new ]
		raise: FBCannotAddTransition 
]

{ #category : 'tests' }
FBFlowTest >> testExecuteGatewayedFlow [ 
	| instance |
	instance := FBFlow gatewayedFlow newInstance.
	instance execute.
	self assert: instance atEnd 
]

{ #category : 'tests' }
FBFlowTest >> testExecuteSimpleFlow [ 
	| instance |
	instance := FBFlow simpleFlow newInstance.
	instance execute.
	self assert: instance atEnd 
]

{ #category : 'tests' }
FBFlowTest >> testFlowWithCycle [
	
	self 
		should: [ FBFlow withCycle ]
		raise: FBFlowIsCyclic 
	
]

{ #category : 'tests' }
FBFlowTest >> testIsCyclic [ 
	| flow |
	flow := FBFlow withCycleForce.
	self
		should: [ flow validate ]
		raise: FBFlowIsCyclic  
]

{ #category : 'tests' }
FBFlowTest >> testIsNotCyclic [ 
	| flow |
	flow := FBFlow complex.
	self
		shouldnt: [ flow validate ]
		raise: FBFlowIsCyclic  
]

{ #category : 'tests' }
FBFlowTest >> testNodeWithId [
	| flow id |
	flow := FBFlow simpleFlow.
	id := flow start id.
	self assert: (flow nodeWithId: id) equals: flow start
]

{ #category : 'tests' }
FBFlowTest >> testNodeWithIdError [
	| flow |
	flow := FBFlow simpleFlow.
	self 
		should: [ flow nodeWithId: #bogus ]
		raise: FBNodeNotFound 
]

{ #category : 'tests' }
FBFlowTest >> testParallelNodeEmptyList [
	| flow instance |
	flow := FBFlow parallelFlowOpen.
	instance := flow newInstance.
	instance executeWith: { }.
	self assert: instance atEnd.
	self assert: instance state equals: #done.
	"there should be one activation per node. The flow should have stopped at the parallel node because the collection was empty"
	self assert: instance activations size equals:  2.

]

{ #category : 'tests' }
FBFlowTest >> testParallelNodeJoined [
	| flow instance |
	flow := FBFlow parallelFlowJoined.
	instance := flow newInstance.
	instance executeWith: { 1 . 2 . 3 }.
	self assert: instance atEnd.

]

{ #category : 'tests' }
FBFlowTest >> testParallelNodeOpenEnd [
	| flow instance |
	flow := FBFlow parallelFlowOpen.
	instance := flow newInstance.
	instance executeWith: { 1 . 2 . 3 }.
	self assert: instance atEnd.
	self assert: instance state equals: #done.
	"there should be one activation per node.
	The activation for a parallel node is specific and holds collection of arguments and values"
	self assert: instance activations size equals: flow nodes size

]

{ #category : 'tests' }
FBFlowTest >> testParallelNodeStepping [
	| flow instance activation |
	flow := FBFlow parallelFlowOpen.
	instance := flow newInstance.
	instance initialValue: { 1 . 2 . 3 }.
	instance step; step; step.
	activation := instance activations detect: [ :each | each isKindOf: FBParallelActivation ].
	self deny: instance state equals: #done.
]

{ #category : 'tests' }
FBFlowTest >> testParallelNodeWaiting [
	| flow instance |
	flow := FBFlow parallelFlowWaiting.
	instance := flow newInstance.
	instance executeWith: { 1 . 2 . 3 }.
	self deny: instance atEnd.
	self assert: instance pending isEmpty.
	self assert: instance state equals: #waiting.
	self assert: instance suspended size equals: 3

]

{ #category : 'tests' }
FBFlowTest >> testRemoveNode [
	| flow intermediate |
	flow := FBFlow simpleFlow.
	intermediate := flow start outgoing first target.
	intermediate remove.
	self assert: flow nodes size equals: 2
]

{ #category : 'tests' }
FBFlowTest >> testRemoveNodeFlow [
	| flow intermediate |
	flow := FBFlow simpleFlow.
	intermediate := flow start outgoing first target.
	flow removeNode: intermediate.
	self assert: flow nodes size equals: 2
]

{ #category : 'tests' }
FBFlowTest >> testRemoveTransitionWithId [
	| flow transition t |
	flow := FBFlow simpleFlow.
	transition := flow start outgoing first.
	self assert: (flow transitionWithId: transition id) equals: transition.
	transition detach.
	t := flow transitionWithId: transition id ifAbsent: nil.
	self assert: t isNil
]

{ #category : 'tests' }
FBFlowTest >> testStartNodeNoIncoming [
	| flow |
	flow := FBFlow simpleFlow.
	self 
		should: [ flow start addIncomingNode: FBNode new ]
		raise: FBCannotAddTransition 
]

{ #category : 'tests' }
FBFlowTest >> testStartNodeOneOutgoing [
	| flow |
	flow := FBFlow simpleFlow.
	self 
		should: [ flow start addOutgoingNode: FBNode new ]
		raise: FBCannotAddTransition 
]

{ #category : 'tests' }
FBFlowTest >> testTransitionWithId [
	| flow transition |
	flow := FBFlow simpleFlow.
	transition := flow start outgoing first.
	self assert: (flow transitionWithId: transition id) equals: transition
]
