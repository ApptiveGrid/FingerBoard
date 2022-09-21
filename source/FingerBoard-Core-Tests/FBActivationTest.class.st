Class {
	#name : #FBActivationTest,
	#superclass : #FBTest,
	#category : #'FingerBoard-Core-Tests'
}

{ #category : #tests }
FBActivationTest >> testEnvironment [
	| activation node |
	node := FBTestTaskWithBehavior new.
	activation := FBActivation new.
	node activateWith: activation.
	self assert: (activation environment at: #status) equals: '200'
]

{ #category : #tests }
FBActivationTest >> testEnvironmentSchema [
	| activation node |
	node := FBTestTaskWithBehavior new.
	activation := FBActivation new node: node.
	self assert: (activation environmentSchema at: #status) class equals: FBPropertyStringType 
]
