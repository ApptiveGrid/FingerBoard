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
FBFlowInstance >> atEnd [
	^ state = #completed
]

{ #category : #executing }
FBFlowInstance >> execute [
	state := #running.
	self executor execute
]

{ #category : #finalization }
FBFlowInstance >> executor [ 
	^ executor ifNil: [
		executor := FBFlowExecutor new 
			instance: self ]
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
