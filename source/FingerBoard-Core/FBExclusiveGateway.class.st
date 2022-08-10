Class {
	#name : #FBExclusiveGateway,
	#superclass : #FBGateway,
	#category : #'FingerBoard-Core'
}

{ #category : #converting }
FBExclusiveGateway >> asRoassalShape [
	^ RSBox new 
		size: 100;
		color: (Color orange alpha: 0.5);
		cornerRadius: 15;
		model: self;
		yourself
]

{ #category : #'as yet unclassified' }
FBExclusiveGateway >> executeIn: aFBExecutor [ 
	| value next |
	value := aFBExecutor valueForNode: incoming first source.
	next := outgoing 
		detect: [ :each | each condition value: value ]
		ifNone: [ Error signal: 'conditions do not match' ].
	aFBExecutor addPending: next target
]
