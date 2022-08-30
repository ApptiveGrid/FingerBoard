Class {
	#name : #FBTest,
	#superclass : #TestCase,
	#category : #'FingerBoard-Core-Tests'
}

{ #category : #tests }
FBTest >> gatewayedFlow [ 
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
FBTest >> simpleFlow [ 
	| start end intermediate |
	start := FBStartEvent new.
	intermediate := start addOutgoingNode: FBTask new.
	end := intermediate addOutgoingNode: FBEndEvent new.
	^ FBFlow new start: start
]
