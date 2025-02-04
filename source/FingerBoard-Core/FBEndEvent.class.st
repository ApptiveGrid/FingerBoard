Class {
	#name : 'FBEndEvent',
	#superclass : 'FBEvent',
	#category : 'FingerBoard-Core-Model',
	#package : 'FingerBoard-Core',
	#tag : 'Model'
}

{ #category : 'instance creation' }
FBEndEvent class >> typeName [

	^ #end
]

{ #category : 'adding' }
FBEndEvent >> addOutgoing: aTransition [ 
	FBCannotAddTransition signal: 'an end node cannot have outgoing transitions'
]

{ #category : 'accessing' }
FBEndEvent >> defaultBehaviorClass [
	^ FBEndEventBehavior
]

{ #category : 'initialization' }
FBEndEvent >> initialize [ 
	super initialize.
	name := 'end'
]
