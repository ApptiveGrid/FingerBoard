Class {
	#name : 'FBFlow',
	#superclass : 'Object',
	#instVars : [
		'name',
		'start',
		'nodesMap'
	],
	#classInstVars : [
		'activationClass',
		'transitionClass'
	],
	#category : 'FluxBase-Core-Model',
	#package : 'FluxBase-Core',
	#tag : 'Model'
}

{ #category : 'accessing' }
FBFlow class >> activationClass [ 
	^ activationClass ifNil: [
		activationClass := self defaultActivationClass ]
]

{ #category : 'accessing' }
FBFlow class >> activationClass: anObject [

	activationClass := anObject
]

{ #category : 'as yet unclassified' }
FBFlow class >> complex [
	<sampleInstance>
	| start end one two three four five six seven eight nine |
	start := FBStartEvent new.
	end := FBEndEvent new.
	one := FBTask named: 'one'.
	two := FBTask named: 'two'.
	three := FBTask named: 'three'.
	four := FBTask named: 'four'.
	five := FBTask named: 'five'.
	six := FBTask named: 'six'.
	seven := FBTask named: 'seven'.
	eight := FBTask named: 'eight'.
	nine := FBTask named: 'nine'.
	
	start --> one --> two --> three --> four.
	three --> six.
	two --> five --> six.
	one --> seven --> eight.
	seven --> nine.
	^ FBFlow new start: start
]

{ #category : 'accessing' }
FBFlow class >> defaultActivationClass [
	^ FBActivation 
]

{ #category : 'accessing' }
FBFlow class >> defaultTransitionClass [
	^ FBTransition 
]

{ #category : 'tests' }
FBFlow class >> gatewayedFlow [ 
	<sampleInstance>
	| start end bigger smaller gateway value |
	start := FBStartEvent new.
	value := FBTestTask named: 'generate random number'.
	bigger := FBTask named: 'bigger'.
	smaller := FBTask named: 'smaller'.
	end := FBEndEvent new.
	gateway := (FBExclusiveGateway named: '>= 5 | < 5').
	gateway --> (bigger when: [:x | x >= 5 ]) --> end.
	gateway --> (smaller when: [:x | x < 5 ]) --> end.
	start --> value --> gateway.
	^ FBFlow new start: start
]

{ #category : 'tests' }
FBFlow class >> parallelFlowJoined [ 
	<sampleInstance>
	| start end parallel p1 p2 join |
	start := FBStartEvent new.
	parallel := start addOutgoingNode: (FBParallelNode named: 'parallel fork').
	p1 := parallel addOutgoingNode: (FBTestTask named: 'p1 task').
	p2 := p1 addOutgoingNode: (FBTestTask named: 'p2 task').
	join := p2 addOutgoingNode: (FBJoinNode named: 'join').
	end := join addOutgoingNode: FBEndEvent new.
	
	^ FBFlow new start: start
]

{ #category : 'tests' }
FBFlow class >> parallelFlowOpen [
	<sampleInstance>
	| start end parallel p1 p2 |
	start := FBStartEvent new.
	parallel := start addOutgoingNode: (FBParallelNode named: 'parallel task').
	p1 := parallel addOutgoingNode: (FBTestTask named: 'p1 task').
	p2 := p1 addOutgoingNode: (FBTestTask named: 'p2 task').
	end := p2 addOutgoingNode: FBEndEvent new.
	^ FBFlow new start: start
]

{ #category : 'tests' }
FBFlow class >> parallelFlowWaiting [
	<sampleInstance>
	| start end parallel p1 wait |
	start := FBStartEvent new.
	p1 := start addOutgoingNode: ((FBPluggableTask named: 'bypass') block: [ :activation | activation value: activation argument ]).
	parallel := p1 addOutgoingNode: (FBParallelNode named: 'parallel task').
	p1 addOutgoingNode:  (FBTestTask named: 'p2 task').
	wait := FBPluggableWait new condition: [ :x |false ]; yourself.
	p1 := parallel addOutgoingNode: (wait).
	end := wait addOutgoingNode: FBEndEvent new.
	^ FBFlow new start: start
]

{ #category : 'tests' }
FBFlow class >> simpleFlow [ 
	<sampleInstance>
	| start end intermediate |
	start := FBStartEvent new.
	intermediate := start addOutgoingNode: (FBTask named: 'simple task').
	end := intermediate addOutgoingNode: FBEndEvent new.
	^ FBFlow new start: start
]

{ #category : 'tests' }
FBFlow class >> simpleFlowWithError [
	<sampleInstance>
	| start end intermediate |
	start := FBStartEvent new.
	intermediate := start addOutgoingNode: (FBErrorTestTask  named: 'simple task with handled error').
	end := intermediate addOutgoingNode: FBEndEvent new.
	^ FBFlow new start: start
]

{ #category : 'tests' }
FBFlow class >> simpleFlowWithSystemError [
	<sampleInstance>
	| start end intermediate |
	start := FBStartEvent new.
	intermediate := start addOutgoingNode: (FBSystemErrorTestTask  named: 'simple task with unhandled error').
	end := intermediate addOutgoingNode: FBEndEvent new.
	^ FBFlow new start: start
]

{ #category : 'tests' }
FBFlow class >> simpleWaitFlow [ 
	<sampleInstance>
	| start end wait |
	start := FBStartEvent new.
	end := FBEndEvent new.
	wait := FBPluggableWait new condition: [ :x | x odd ].
	start --> wait --> end.
	^ FBFlow new start: start
]

{ #category : 'accessing' }
FBFlow class >> transitionClass [ 
	^ transitionClass ifNil: [
		transitionClass := self defaultTransitionClass ]
]

{ #category : 'accessing' }
FBFlow class >> transitionClass: anObject [

	transitionClass := anObject
]

{ #category : 'as yet unclassified' }
FBFlow class >> withCycle [
	<sampleInstance>
	| start end one two three four five six seven eight nine |
	start := FBStartEvent new.
	end := FBEndEvent new.
	one := FBTask named: 'one'.
	two := FBTask named: 'two'.
	three := FBTask named: 'three'.
	four := FBTask named: 'four'.
	five := FBTask named: 'five'.
	six := FBTask named: 'six'.
	seven := FBTask named: 'seven'.
	eight := FBTask named: 'eight'.
	nine := FBTask named: 'nine'.
	
	start --> one --> two --> three --> four.
	three --> six.
	"add cycle"
	six --> five --> two.
	one --> seven --> eight.
	seven --> nine.
	nine --> five.
	^ FBFlow new start: start
]

{ #category : 'as yet unclassified' }
FBFlow class >> withCycleForce [
	<sampleInstance>
	| start end one two three four five six seven eight nine |
	start := FBStartEvent new.
	end := FBEndEvent new.
	one := FBTask named: 'one'.
	two := FBTask named: 'two'.
	three := FBTask named: 'three'.
	four := FBTask named: 'four'.
	five := FBTask named: 'five'.
	six := FBTask named: 'six'.
	seven := FBTask named: 'seven'.
	eight := FBTask named: 'eight'.
	nine := FBTask named: 'nine'.
	
	[ start --> one --> two --> three --> four.
	three --> six.
	"add cycle"
	six --> five --> two.
	one --> seven --> eight.
	seven --> nine.
	nine --> five ] 
		on: FBFlowIsCyclic 
		do: [:err | err resume ].
	^ FBFlow new start: start
]

{ #category : 'visiting' }
FBFlow >> acceptFingerBoard: aFBVisitor [ 
	^ aFBVisitor visitFlow: self
]

{ #category : 'accessing' }
FBFlow >> activationClass [ 
	^ self class activationClass
]

{ #category : 'adding' }
FBFlow >> addNode: aFBNode [
	nodesMap 
		at: aFBNode id 
		ifAbsentPut: [ 
			aFBNode setFlow: self.
			aFBNode ]
	
	 
]

{ #category : 'removing' }
FBFlow >> basicRemoveNode: aNode [ 
	nodesMap removeKey: aNode id
]

{ #category : 'accessing' }
FBFlow >> end [
	start ifNil: [ Error signal: 'Cannot find end without a start node being present' ].
	^ start findEnd
]

{ #category : 'initialization' }
FBFlow >> initialize [ 
	super initialize.
	nodesMap := OrderedDictionary new
]

{ #category : 'accessing' }
FBFlow >> name [

	^ name
]

{ #category : 'accessing' }
FBFlow >> name: anObject [

	name := anObject
]

{ #category : 'instance creation' }
FBFlow >> newInstance [
	^ FBFlowInstance new 
		flow: self
]

{ #category : 'as yet unclassified' }
FBFlow >> nodeWithId: aString [ 
	^ self 
		nodeWithId: aString  
		ifAbsent: [ FBNodeNotFound signal: 'Node with id ', aString asString, ' not found' ]
]

{ #category : 'as yet unclassified' }
FBFlow >> nodeWithId: aString ifAbsent: aBlock [
	^ nodesMap 
		at: aString 
		ifAbsent: aBlock
]

{ #category : 'accessing' }
FBFlow >> nodeWithName: aString [ 
	^ nodesMap values 
		detect: [ :each | each name = aString ]
		ifNone: [ nil ]
]

{ #category : 'accessing' }
FBFlow >> nodes [
	^ nodesMap values
]

{ #category : 'removing' }
FBFlow >> removeNode: aNode [ 
	aNode detach.
	self basicRemoveNode: aNode
]

{ #category : 'accessing' }
FBFlow >> start [
	^ start ifNil: [ 
		start := (FBStartEvent named: #start) 
			flow: self;
			yourself ]
]

{ #category : 'accessing' }
FBFlow >> start: aFBStartEvent [ 
	aFBStartEvent flow: self.
	start := aFBStartEvent 
]

{ #category : 'accessing' }
FBFlow >> transitionClass [ 
	^ self class transitionClass 
]

{ #category : 'querying' }
FBFlow >> transitionWithId: aString [ 
	^ self 
		transitionWithId: aString 
		ifAbsent: [ FBTranstionNotFound signal: 'transition with id ', aString asString, ' not found' ]
]

{ #category : 'querying' }
FBFlow >> transitionWithId: aString ifAbsent: aBlock [
	nodesMap do: [ :node | 
		node outgoing 
			detect: [ :each | each id = aString ]
			ifFound: [ :transition | ^ transition ] ].
	^ aBlock value
]

{ #category : 'accessing' }
FBFlow >> validate [ 
	(FBTopologicalSorter new 	
		nodes: nodesMap values;
		isAcyclic)
		ifFalse: [ FBFlowIsCyclic  signal: 'cycle detected'].
]
