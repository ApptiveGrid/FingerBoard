Class {
	#name : #FBExclusiveGateway,
	#superclass : #FBGateway,
	#category : #'FingerBoard-Core'
}

{ #category : #converting }
FBExclusiveGateway >> asRoassalShape [
	^ RSPolygon new
		points: (Array with: 0 @ 0 with: 70 @ 50 with: 0 @ 100 with: -70 @ 50);
		color: (Color lightGreen alpha: 1);
		model: self;
		yourself.
]

{ #category : #'as yet unclassified' }
FBExclusiveGateway >> executeIn: aFBActivation [ 
	| next |
	next := outgoing 
		detect: [ :each | each condition value: aFBActivation argument ]
		ifNone: [ Error signal: 'conditions do not match' ].
	aFBActivation followTransition: next.
	aFBActivation done

]
