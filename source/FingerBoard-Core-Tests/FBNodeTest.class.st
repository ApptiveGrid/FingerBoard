Class {
	#name : 'FBNodeTest',
	#superclass : 'FBTest',
	#category : 'FingerBoard-Core-Tests',
	#package : 'FingerBoard-Core-Tests'
}

{ #category : 'tests' }
FBNodeTest >> testNewNodeHasId [
	| node |
	node := FBNode new.
	self assert: (node id isKindOf: String).
	self assert: node id notEmpty
]

{ #category : 'tests' }
FBNodeTest >> testNodePropertiesDefined [
	| node schema |
	node := FBTestTaskWithBehavior  new.
	schema := node propertySchema.
	self assert: schema class equals: FBPropertySchema.
	self assert: schema keys size equals: 2.
]

{ #category : 'tests' }
FBNodeTest >> testNodePropertiesUndefined [
	| node schema |
	node := FBTestTask new.
	schema := node propertySchema.
	self assert: schema class equals: FBPropertySchema.
	self assert: schema keys size equals: 0
]

{ #category : 'tests' }
FBNodeTest >> testNodeSetProperty [
	| node |
	node := FBTestTaskWithBehavior  new.
	node propertyAt: #name put: 'Hello World'.
	self assert: (node propertyAt: #name) equals: 'Hello World'
]
