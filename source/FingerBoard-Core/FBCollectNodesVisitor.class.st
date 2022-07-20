Class {
	#name : #FBCollectNodesVisitor,
	#superclass : #FBVisitor,
	#instVars : [
		'nodes'
	],
	#category : #'FingerBoard-Core'
}

{ #category : #accesing }
FBCollectNodesVisitor >> nodes [
	^ nodes ifNil: [ 
		nodes := OrderedCollection new ]
]

{ #category : #visiting }
FBCollectNodesVisitor >> visitNode: aFBNode [
	super visitNode: aFBNode.
	self nodes add: aFBNode 
]