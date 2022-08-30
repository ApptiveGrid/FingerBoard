Class {
	#name : #FBExclusiveGateway,
	#superclass : #FBGateway,
	#category : #'FingerBoard-Core'
}

{ #category : #'instance creation' }
FBExclusiveGateway class >> typeName [

	^ #exclusiveGateway
]

{ #category : #converting }
FBExclusiveGateway >> asRoassalShape [
	^ RSPolygon new
		points: (Array with: 0 @ 0 with: 70 @ 50 with: 0 @ 100 with: -70 @ 50);
		color: (Color blue alpha: 0.5);
		model: self;
		yourself.
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
