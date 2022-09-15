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
	gateway --> (bigger when: [:x | x >= 5 ]) --> end.
	gateway --> (smaller when: [:x | x < 5 ]) --> end.
	start --> value --> gateway.
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
FBTest >> simpleFlowWithError [
	| start end intermediate |
	start := FBStartEvent new.
	intermediate := start addOutgoingNode: (FBErrorTestTask  named: 'simple task').
	end := intermediate addOutgoingNode: FBEndEvent new.
	^ FBFlow new start: start
]

{ #category : #tests }
FBTest >> simpleFlowWithSystemError [
	| start end intermediate |
	start := FBStartEvent new.
	intermediate := start addOutgoingNode: (FBSystemErrorTestTask  named: 'simple task').
	end := intermediate addOutgoingNode: FBEndEvent new.
	^ FBFlow new start: start
]

{ #category : #tests }
FBTest >> simpleWaitFlow [ 
	| start end wait |
	start := FBStartEvent new.
	end := FBEndEvent new.
	wait := FBPluggableWait new condition: [ :x | x odd ].
	start --> wait --> end.
	^ FBFlow new start: start
]
