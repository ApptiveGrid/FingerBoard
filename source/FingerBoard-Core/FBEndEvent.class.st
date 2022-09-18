Class {
	#name : #FBEndEvent,
	#superclass : #FBEvent,
	#category : #'FingerBoard-Core-Model'
}

{ #category : #'instance creation' }
FBEndEvent class >> typeName [

	^ #end
]

{ #category : #accessing }
FBEndEvent >> defaultBehaviorClass [
	^ FBEndEventBehavior
]

{ #category : #initialization }
FBEndEvent >> initialize [ 
	super initialize.
	name := 'end'
]
