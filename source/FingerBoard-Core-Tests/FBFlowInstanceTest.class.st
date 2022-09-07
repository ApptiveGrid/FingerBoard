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
	flowInstance initialValue: 7.
	flowInstance execute.
	self assert: flowInstance isComplete.
	self assert: flowInstance atEnd equals: true
]

{ #category : #tests }
FBFlowInstanceTest >> testCreateFlowInstance [
	| flowInstance |
	flowInstance := self simpleFlow newInstance.
	self assert: flowInstance pending size equals: 1.
	self assert: flowInstance pending first class equals: FBStartEvent  

]

{ #category : #tests }
FBFlowInstanceTest >> testSimpleWaitCompletion [
	| instance |
	instance := self simpleWaitFlow newInstance. 
	instance executeWith: 3.
	self assert: instance isComplete 
]

{ #category : #tests }
FBFlowInstanceTest >> testSimpleWaitSuspension [ 
	| instance |
	instance := self simpleWaitFlow newInstance. 
	instance executeWith: 2.
	self deny: instance isComplete 
]

{ #category : #tests }
FBFlowInstanceTest >> testStepping [
	| flowInstance |
	flowInstance := self simpleFlow newInstance.
	flowInstance initialValue: 7.
	self assert: flowInstance nextNode class equals: FBStartEvent.
	flowInstance step.
	self assert: flowInstance nextNode class equals: FBTask.
	flowInstance step.
	self assert: flowInstance nextNode class equals: FBEndEvent.
	flowInstance step.
	self assert: flowInstance isComplete.
	self assert: flowInstance atEnd equals: true
]
