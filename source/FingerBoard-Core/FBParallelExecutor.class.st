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
FBParallelExecutor >> activationClass [
	^ FBParallelActivation
]

{ #category : #accessing }
FBParallelExecutor >> atEnd [ 
	^ (index = list size) and: [ pending isEmpty ]
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
FBParallelExecutor >> node: aFBParallelNode [ 
	node := aFBParallelNode.
	pending addAll: node outgoing 
]

{ #category : #stepping }
FBParallelExecutor >> step [
	| transition lastValue activation |
	transition := pending removeFirst. 
	lastValue := (transition source lastValueIn: self) at: index.
	activation := self newActivation: transition.
	activation argument: lastValue.
	self activate: activation.
	(pending isEmpty and: [index < list size]) ifTrue: [ 
		index := index + 1.
		pending addAll: node outgoing ]
	

]