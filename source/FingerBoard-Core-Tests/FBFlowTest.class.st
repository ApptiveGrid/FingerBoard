Class {
	#name : #FBFlowTest,
	#superclass : #TestCase,
	#category : #'FingerBoard-Core-Tests'
}

{ #category : #tests }
FBFlowTest >> gatewayedFlow [ 
	| start end bigger smaller gateway |
	start := FBStartEvent new.
	bigger := FBTask new.
	smaller := FBTask new.
	gateway := FBExclusiveGateway new
	 addOutgoingNode: bigger withCondition: [:x | x notNil ];
	 addOutgoingNode: smaller withCondition: [:x | x isNil ].
	start addOutgoingNode: gateway.
	end := FBEndEvent new.
	bigger addOutgoingNode: end.
	smaller addOutgoingNode: end.
	^ FBFlow new start: start
]

{ #category : #tests }
FBFlowTest >> simpleFlow [ 
	| start end intermediate |
	start := FBStartEvent new.
	intermediate := start addOutgoingNode: FBTask new.
	end := intermediate addOutgoingNode: FBEndEvent new.
	^ FBFlow new start: start
]

{ #category : #tests }
FBFlowTest >> testCreateFlow [ 
	| start end intermediate flow |
	start := FBStartEvent new.
	intermediate := start addOutgoingNode: FBNode new.
	end := intermediate addOutgoingNode: FBEndEvent new.
	flow := FBFlow new 
		start: start.
	self assert: flow end equals: end

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
