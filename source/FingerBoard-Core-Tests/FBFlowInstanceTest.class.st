Class {
	#name : #FBFlowInstanceTest,
	#superclass : #FBTest,
	#category : #'FingerBoard-Core-Tests'
}

{ #category : #tests }
FBFlowInstanceTest >> testActivationsAreDone [
	| flowInstance |
	flowInstance := self simpleFlow newInstance.
	flowInstance executeWith: nil.
	self assert: (flowInstance activations allSatisfy: [ :each | each state = #done ])
]

{ #category : #tests }
FBFlowInstanceTest >> testCompleted [
	| flowInstance |
	flowInstance := self simpleFlow newInstance.
	flowInstance executeWith: nil.
	self assert: flowInstance state equals: #completed.
	self assert: flowInstance atEnd equals: true
]

{ #category : #tests }
FBFlowInstanceTest >> testCreateFlowInstance [
	| flowInstance |
	flowInstance := self simpleFlow newInstance.
	self assert: flowInstance pending size equals: 1.
	self assert: flowInstance pending first class equals: FBStartEvent  

]
