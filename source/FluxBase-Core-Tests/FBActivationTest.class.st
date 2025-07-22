Class {
	#name : 'FBActivationTest',
	#superclass : 'FBTest',
	#category : 'FluxBase-Core-Tests',
	#package : 'FluxBase-Core-Tests'
}

{ #category : 'tests' }
FBActivationTest >> testEnvironment [
	| activation node |
	node := FBTestTaskWithBehavior new.
	activation := FBActivation new.
	node activateWith: activation.
	self assert: (activation metadata at: #status) equals: '200'
]

{ #category : 'tests' }
FBActivationTest >> testEnvironmentSchema [
	| activation node |
	node := FBTestTaskWithBehavior new.
	activation := FBActivation new node: node.
	self assert: (activation metadataSchema at: #status) class equals: FBPropertyStringType 
]
