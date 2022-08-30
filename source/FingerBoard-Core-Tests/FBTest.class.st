Class {
	#name : #FBTest,
	#superclass : #TestCase,
	#category : #'FingerBoard-Core-Tests'
}

{ #category : #tests }
FBTest >> gatewayedFlow [ 
	| start end bigger smaller gateway value |
	start := FBStartEvent new.
	value := FBTestTask named: 'generate random number'.
	bigger := FBTask named: 'bigger'.
	smaller := FBTask named: 'smaller'.
	end := FBEndEvent new.
	gateway := (FBExclusiveGateway named: '>= 5 | < 5').
	gateway -> (bigger when: [:x | x >= 5 ]) -> end.
	gateway -> (smaller when: [:x | x < 5 ]) -> end.
	start -> value -> gateway.
	^ FBFlow new start: start
]

{ #category : #tests }
FBTest >> gatewayedFlowX [
	| start end bigger smaller gateway value |
	start := FBStartEvent new.
	value := FBTestTask named: 'generate random number'.
	start addOutgoingNode: value.
	bigger := FBTask named: 'bigger'.
	smaller := FBTask named: 'smaller'.
	gateway := (FBExclusiveGateway named: '>= 5 | < 5')
	 addOutgoingNode: bigger withCondition: [:x | x >= 5 ];
	 addOutgoingNode: smaller withCondition: [:x | x < 5 ].
	value addOutgoingNode: gateway.
	end := FBEndEvent new.
	bigger addOutgoingNode: end.
	smaller addOutgoingNode: end.
	^ FBFlow new start: start
]

{ #category : #tests }
FBTest >> simpleFlow [ 
	| start end intermediate |
	start := FBStartEvent new.
	intermediate := start addOutgoingNode: (FBTask named: 'simple task').
	end := intermediate addOutgoingNode: FBEndEvent new.
	^ FBFlow new start: start
]

{ #category : #tests }
FBTest >> simpleWaitFlow [ 
	| start end wait |
	start := FBStartEvent new.
	end := FBEndEvent new.
	wait := FBPluggableWait new condition: [ :x | x odd ].
	start -> wait -> end.
	^ FBFlow new start: start
]
