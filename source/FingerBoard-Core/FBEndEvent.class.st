Class {
	#name : #FBEndEvent,
	#superclass : #FBEvent,
	#category : #'FingerBoard-Core'
}

{ #category : #'instance creation' }
FBEndEvent class >> typeName [

	^ #end
]

{ #category : #accessing }
FBEndEvent >> defaultBehaviorClass [
	^ FBEndEventBehavior
]

{ #category : #'as yet unclassified' }
FBEndEvent >> evaluateIn: aFBActivation [ 
	aFBActivation executor completed
]

{ #category : #initialization }
FBEndEvent >> initialize [ 
	super initialize.
	name := 'end'
]
