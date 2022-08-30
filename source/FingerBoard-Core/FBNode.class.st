Class {
	#name : #FBNode,
	#superclass : #Object,
	#instVars : [
		'incoming',
		'outgoing',
		'name'
	],
	#category : #'FingerBoard-Core'
}

{ #category : #testing }
FBNode class >> isAbstract [

	^ true
]

{ #category : #connecting }
FBNode >> addIncoming: aFBTransition [ 
	incoming add: aFBTransition.
]

{ #category : #connecting }
FBNode >> addOutgoing: aFBTransition [ 
	outgoing add: aFBTransition.
	aFBTransition target addIncoming: aFBTransition 
]

{ #category : #connecting }
FBNode >> addOutgoingNode: aFBNode [ 
	self addOutgoing: (FBTransition source: self target: aFBNode).
	^ aFBNode 
]

{ #category : #converting }
FBNode >> asRoassalShape [
	^ RSLabel new text: 'N/A'
]

{ #category : #'as yet unclassified' }
FBNode >> evaluateIn: aFBActivation [
	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
FBNode >> executeIn: aFBActivation [ 
	self prepareIn: aFBActivation.
	self evaluateIn: aFBActivation.
	self postProcessIn: aFBActivation 
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

{ #category : #'as yet unclassified' }
FBNode >> inspectionFlow [
	<inspectorPresentationOrder: 0 title: 'flow'>
	^ SpRoassal3InspectorPresenter  new 
		canvas: (FBFlowMapBuilder new 
			nodes: self neighbourNodes;
			build )
		yourself
]

{ #category : #accessing }
FBNode >> name [
	^ name
]

{ #category : #accessing }
FBNode >> name: aString [ 
	name := aString
]

{ #category : #'as yet unclassified' }
FBNode >> neighbourNodes [
	^ ((incoming collect: #source), (outgoing collect: #target)) add: self; yourself
]

{ #category : #accessing }
FBNode >> outgoing [
	^ outgoing
]

{ #category : #'as yet unclassified' }
FBNode >> postProcessIn: aFBActivation [ 
	aFBActivation done
]

{ #category : #'as yet unclassified' }
FBNode >> prepareIn: aFBActivation [
]
