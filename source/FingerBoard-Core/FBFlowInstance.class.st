Class {
	#name : #FBFlowInstance,
	#superclass : #Object,
	#instVars : [
		'flow',
		'state',
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
	^ state = #completed
]

{ #category : #executing }
FBFlowInstance >> execute [
	state := #running.
	self executor execute
]

{ #category : #executing }
FBFlowInstance >> executeWith: anObject [
	state := #running.
	self executor executeWith: anObject
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

{ #category : #initialization }
FBFlowInstance >> initialize [ 
	super initialize.
	state := #initialized
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
	^ state = #completed
]

{ #category : #accessing }
FBFlowInstance >> pending [
	^ self executor pending
]

{ #category : #accessing }
FBFlowInstance >> start [
	^ flow start
]

{ #category : #accessing }
FBFlowInstance >> state [

	^ state
]

{ #category : #accessing }
FBFlowInstance >> state: anObject [

	state := anObject
]
