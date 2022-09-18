Class {
	#name : #FBTopologicalSorter,
	#superclass : #Object,
	#instVars : [
		'nodes',
		'visited',
		'sorted'
	],
	#category : #'FingerBoard-Core-Base'
}

{ #category : #testing }
FBTopologicalSorter >> hasBeenVisited: aFBNode [
	^ visited includes: aFBNode 
]

{ #category : #testing }
FBTopologicalSorter >> hasCycle [
	self topologicalSort.
	^ self isAcyclic not
]

{ #category : #initialization }
FBTopologicalSorter >> initialize [ 
	super initialize.
	self reset
]

{ #category : #testing }
FBTopologicalSorter >> isAcyclic [
	^ nodes allSatisfy: [ :node |
		node outgoing allSatisfy: [ :transition | 
			(sorted indexOf: transition source) < (sorted indexOf: transition target) ] ]
]

{ #category : #accessing }
FBTopologicalSorter >> nodes: aCollection [ 
	nodes := aCollection
]

{ #category : #initialization }
FBTopologicalSorter >> reset [ 
	visited := Set new.
	sorted := OrderedCollection new
]

{ #category : #'as yet unclassified' }
FBTopologicalSorter >> topologicalSort [
	| topNodes |
	"visit all nodes"
	[ nodes size = visited size ] whileFalse: [ 
		topNodes := self unvisitedTopNodes.
		topNodes do: [ :candidate |
			self visitNode: candidate ] ].
	"nodes are added depth first so we reverse the collection to 
	have downward pointing sorting"
	sorted := sorted reverse
]

{ #category : #'as yet unclassified' }
FBTopologicalSorter >> unvisitedTopNodes [
	"top nodes are nodes that have no incoming transition that hasn't been visitied. "
	^ nodes select: [ :node | 
		(self hasBeenVisited: node) not and: [  
			(node incoming 
				reject: [ :transition | 
					self hasBeenVisited: transition source ]) isEmpty ] ]
]

{ #category : #visiting }
FBTopologicalSorter >> visitNode: aFBNode [
	"we want to visit all nodes only once"
	(self hasBeenVisited: aFBNode) ifTrue: [ ^ self ]. 
	"add visited flag before visiting so endless loops are prevented"
	visited add: aFBNode.
	"recurse into target nodes until all are resolved. This way leave nodes
	get add to the sorting first, then their depending nodes"
	aFBNode outgoing do: [ :transition |
		self visitNode: transition target ].
	"if all outgoing nodes have been resolved we can put this node on the
	sorted stack"
	sorted add: aFBNode 
]
