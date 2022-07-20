Class {
	#name : #FBNode,
	#superclass : #Object,
	#instVars : [
		'incoming',
		'outgoing'
	],
	#category : #'FingerBoard-Core'
}

{ #category : #connecting }
FBNode >> addOutgoing: aFBTransition [ 
	outgoing add: aFBTransition 
]

{ #category : #connecting }
FBNode >> addOutgoingNode: aFBNode [ 
	self addOutgoing: (FBTransition source: self target: aFBNode).
	^ aFBNode 
]

{ #category : #'as yet unclassified' }
FBNode >> findEnd [
	(self isKindOf: FBEndEvent) ifTrue: [ ^ self ]. 
	outgoing do: [ :transition |
		(transition target findEnd ifNotNil: [:end | ^ end ]) ].
	^ nil
]

{ #category : #testing }
FBNode >> hasOutgoing [ 
	^ outgoing notEmpty
]

{ #category : #initialization }
FBNode >> initialize [ 
	super initialize.
	incoming := OrderedCollection new.
	outgoing := OrderedCollection new
]

{ #category : #accessing }
FBNode >> outgoing [
	^ outgoing
]
