Class {
	#name : #FBNodeTest,
	#superclass : #FBTest,
	#category : #'FingerBoard-Core-Tests'
}

{ #category : #tests }
FBNodeTest >> testNewNodeHasId [
	| node |
	node := FBNode new.
	self assert: (node id isKindOf: String).
	self assert: node id notEmpty
]
