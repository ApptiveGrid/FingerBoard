Class {
	#name : #FBParallelExecutor,
	#superclass : #FBBaseExecutor,
	#instVars : [
		'list',
		'node',
		'index',
		'map'
	],
	#category : #'FingerBoard-Core-Model'
}

{ #category : #accessing }
FBParallelExecutor >> activate: activation [

	"unlike default behavior, the activation is already added to the list when being instantiated.
	here we only take care of the execution part"
	flowInstance activateProtected: activation 
]

{ #category : #private }
FBParallelExecutor >> activateTransition: aTransition with: value [

	| activation |
	activation := self newActivation: aTransition.
	activation argument: value.
	self activate: activation
]

{ #category : #accessing }
FBParallelExecutor >> activationClass [
	^ node activationClass
]

{ #category : #accessing }
FBParallelExecutor >> atEnd [ 
	^((index = list size) and: [ pending isEmpty ])and:[suspended isEmpty]
]

{ #category : #execution }
FBParallelExecutor >> execute [ 
	[   
		[ pending isEmpty ] whileFalse: [
			self step ].
		index := index + 1.
		(index > list size) ifTrue: [ ^ self ].
		pending addAll: node outgoing. 
 	] repeat
]

{ #category : #accessing }
FBParallelExecutor >> index [
	^ index
]

{ #category : #initialization }
FBParallelExecutor >> initialize [ 
	super initialize.
	index := 1.
	map := Dictionary new 

]

{ #category : #testing }
FBParallelExecutor >> isLastIndex [

	^ index = list size
]

{ #category : #testing }
FBParallelExecutor >> isParallel [

	^ true
]

{ #category : #accessing }
FBParallelExecutor >> list: aCollection [ 
	list := aCollection.

]

{ #category : #'instance creation' }
FBParallelExecutor >> newActivation [
	^ self activationClass new
		executor: self;
		initializeValues: list size 
]

{ #category : #stepping }
FBParallelExecutor >> newActivation: transition [
	^ map 
		at: transition
		ifAbsentPut: [ 
			self activations add: (self newActivation 
				node: transition target) ]
]

{ #category : #accessing }
FBParallelExecutor >> node [
	^ node 
]

{ #category : #accessing }
FBParallelExecutor >> node: aFBParallelNode [ 
	node := aFBParallelNode.
	pending addAll: node outgoing 
]

{ #category : #services }
FBParallelExecutor >> outputFor: anActivation [

	anActivation isDone ifTrue: [  ^ anActivation value first].
	^ anActivation value at: self index .
]

{ #category : #private }
FBParallelExecutor >> shouldFollowTransition: transition with: value [
	"this parallel executor has been instantiated right after activating a parallel node.
	the transition following the parallel node may have condition.
	we make sure that this condition is evaluated before activating a given iteration value"

	transition source = node ifFalse: [ ^ true ].
	^ (self activationOf: node) shouldFollowTransition: transition with: value
]

{ #category : #services }
FBParallelExecutor >> step [

	| transition lastValue values |
	transition := pending removeFirst.
	values := transition source lastValueIn: self.
	lastValue := values at: index.
	(self shouldFollowTransition: transition with: lastValue) ifTrue: [
		self activateTransition: transition with: lastValue ].
	(pending isEmpty and: [ index < list size ]) ifTrue: [
		index := index + 1.
		pending addAll: node outgoing ].
	pending isEmpty ifFalse: [ ^ self ].
	(self activationOf: node) done.
	self stop
]
