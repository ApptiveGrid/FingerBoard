Class {
	#name : 'FBCollectNodesVisitor',
	#superclass : 'FBVisitor',
	#instVars : [
		'nodes'
	],
	#category : 'FingerBoard-Core-Base',
	#package : 'FingerBoard-Core',
	#tag : 'Base'
}

{ #category : 'accesing' }
FBCollectNodesVisitor >> nodes [
	^ nodes ifNil: [ 
		nodes := Set new ]
]

{ #category : 'visiting' }
FBCollectNodesVisitor >> visitNode: aFBNode [
	super visitNode: aFBNode.
	self nodes add: aFBNode 
]
