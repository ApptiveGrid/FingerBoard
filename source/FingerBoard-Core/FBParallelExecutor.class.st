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

{ #category : #stepping }
FBParallelExecutor >> step [

	| transition lastValue activation values |
	transition := pending removeFirst.
	values := transition source lastValueIn: self.
	activation := self newActivation: transition.
	lastValue := values at: index.
	activation argument: lastValue.
	self activate: activation.
	(pending isEmpty and: [ index < list size ]) ifTrue: [
		index := index + 1.
		pending addAll: node outgoing ].
	pending isEmpty ifTrue: [ "when everything has been executed, the parallel activation is done"
		(self activationOf: node) done.
		 self stop ]
]
