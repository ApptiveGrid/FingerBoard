Class {
	#name : #FBStartEvent,
	#superclass : #FBEvent,
	#category : #'FingerBoard-Core'
}

{ #category : #'instance creation' }
FBStartEvent class >> typeName [

	^ #start
]

{ #category : #visiting }
FBStartEvent >> acceptFingerBoard: aFBVisitor [ 
	^ aFBVisitor visitStartEvent: self 
]

{ #category : #accessing }
FBStartEvent >> defaultBehaviorClass [
	^ FBStartEventBehavior
]

{ #category : #initialization }
FBStartEvent >> initialize [ 
	super initialize.
	name := 'start'
]

{ #category : #accessing }
FBStartEvent >> lastValueIn: aFBFlowExecutor [ 
	^ aFBFlowExecutor initialValue 
]

{ #category : #accessing }
FBStartEvent >> source [
	^ self 
]

{ #category : #accessing }
FBStartEvent >> target [
	^ self
]
