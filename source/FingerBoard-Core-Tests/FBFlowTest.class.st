Class {
	#name : #FBFlowTest,
	#superclass : #TestCase,
	#category : #'FingerBoard-Core-Tests'
}

{ #category : #tests }
FBFlowTest >> gatewayedFlow [ 
	| start end bigger smaller gateway value |
	start := FBStartEvent new.
	value := FBTestTask new name: 'generate random number'.
	start addOutgoingNode: value.
	bigger := FBTask new name: 'bigger'.
	smaller := FBTask new name: 'smaller'.
	gateway := FBExclusiveGateway new
	 name: '>= 5 | < 5';
	 addOutgoingNode: bigger withCondition: [:x | x >= 5 ];
	 addOutgoingNode: smaller withCondition: [:x | x < 5 ].
	value addOutgoingNode: gateway.
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
	self assert: flow end equals: end.

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
