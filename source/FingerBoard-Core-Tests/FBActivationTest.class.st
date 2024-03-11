Class {
	#name : #FBActivationTest,
	#superclass : #FBTest,
	#category : #'FingerBoard-Core-Tests'
}

{ #category : #tests }
FBActivationTest >> testEnvironment [
	| activation node |
	node := FBTestTaskWithBehavior new.
	activation := FBActivation new
		node: node.
	activation basicExecute.
	self assert: (activation metadata at: #status) equals: '200'
]

{ #category : #tests }
FBActivationTest >> testEnvironmentSchema [
	| activation node |
	node := FBTestTaskWithBehavior new.
	activation := FBActivation new node: node.
	self assert: (activation metadataSchema at: #status) class equals: FBPropertyStringType 
]
