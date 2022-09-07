Class {
	#name : #FBFlowInstance,
	#superclass : #Object,
	#instVars : [
		'flow',
		'executor'
	],
	#category : #'FingerBoard-Core'
}

{ #category : #accessing }
FBFlowInstance >> activations [
	^ self executor activations
]

{ #category : #accessing }
FBFlowInstance >> atEnd [
	^ executor atEnd
]

{ #category : #executing }
FBFlowInstance >> execute [
	self executor execute
]

{ #category : #executing }
FBFlowInstance >> executeWith: anObject [
	self executor 
		initialValue: anObject;
		execute
]

{ #category : #finalization }
FBFlowInstance >> executor [ 
	^ executor ifNil: [
		executor := FBFlowExecutor new 
			instance: self ]
]

{ #category : #accessing }
FBFlowInstance >> flow [
	^ flow
]

{ #category : #accessing }
FBFlowInstance >> flow: aFBFlow [ 
	flow := aFBFlow 
]

{ #category : #accessing }
FBFlowInstance >> initialValue: anObject [
	self executor initialValue: anObject
]

{ #category : #initialization }
FBFlowInstance >> initialize [ 
	super initialize.

]

{ #category : #'as yet unclassified' }
FBFlowInstance >> inspectionFlow [
	<inspectorPresentationOrder: 0 title: 'flow'>
	^ SpRoassal3InspectorPresenter  new 
		canvas: (FBFlowMapBuilder new 
			nodes: flow nodes;
			activations: self executor activations;
			build )
		yourself
]

{ #category : #testing }
FBFlowInstance >> isComplete [ 
	^ executor isComplete
]

{ #category : #accessing }
FBFlowInstance >> nextNode [
	^ self nextTransition target
]

{ #category : #accessing }
FBFlowInstance >> nextTransition [
	^ executor firstPending
]

{ #category : #accessing }
FBFlowInstance >> pending [
	^ self executor pending
]

{ #category : #accessing }
FBFlowInstance >> start [
	^ flow start
]

{ #category : #executing }
FBFlowInstance >> step [
	^ self executor step
]
