Class {
	#name : #FBFlowInstanceTest,
	#superclass : #FBTest,
	#category : #'FingerBoard-Core-Tests'
}

{ #category : #tests }
FBFlowInstanceTest >> testActivationsAreDone [
	| flowInstance |
	flowInstance := self simpleFlow newInstance.
	flowInstance initialValue: nil.
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
FBFlowInstanceTest >> testFlowAnnouncements [ 
	| flowInstance events |
	flowInstance := self simpleFlow newInstance.
	flowInstance initialValue: 7. 
	events := OrderedCollection new.
	flowInstance announcer 
		when: FBNodeActivationStarted  do: [ :e | events add: e ].
	flowInstance execute.
	self assert: events size equals: flowInstance flow nodes size 
]

{ #category : #tests }
FBFlowInstanceTest >> testFlowAnnouncementsWithError [
	| flowInstance events |
	flowInstance := self simpleFlowWithError newInstance.
	flowInstance initialValue: 7.
	events := OrderedCollection new.
	flowInstance announcer 
		when: FBFlowEvent do: [ :e | events add: e ].
	flowInstance execute.
	self assert: events last class equals: FBNodeActivationErrored.
	self assert: flowInstance activations last state equals: #error 
]

{ #category : #tests }
FBFlowInstanceTest >> testFlowAnnouncementsWithSystemError [
	| flowInstance events |
	flowInstance := self simpleFlowWithSystemError newInstance.
	flowInstance initialValue: 7.
	events := OrderedCollection new.
	flowInstance announcer 
		when: FBFlowEvent do: [ :e | events add: e ].
	self 
		should: [ flowInstance execute ]
		raise: ZeroDivide.
	self assert: events size equals: 7 
]

{ #category : #tests }
FBFlowInstanceTest >> testListActivationEvents [
	| flowInstance events |
	flowInstance := self simpleFlow newInstance.
	flowInstance initialValue: 7. 
	flowInstance execute.
	events := flowInstance eventsOfActivation: flowInstance activations second.
	self assert: events size equals: 2
]

{ #category : #tests }
FBFlowInstanceTest >> testListNodeEvents [
	| flowInstance events node |
	flowInstance := self simpleFlow newInstance.
	flowInstance initialValue: 7. 
	flowInstance execute.
	node := flowInstance flow nodes second.
	self halt.
	events := flowInstance eventsOfNode: node.
	self assert: events size equals: 2
]

{ #category : #tests }
FBFlowInstanceTest >> testSimpleWaitCompletion [
	| instance |
	instance := self simpleWaitFlow newInstance. 
	instance initialValue: 3.
	instance execute.
	self assert: instance isComplete 
]

{ #category : #tests }
FBFlowInstanceTest >> testSimpleWaitSuspension [ 
	| instance |
	instance := self simpleWaitFlow newInstance. 
	instance initialValue: 2.
	instance execute.
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
