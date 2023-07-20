Class {
	#name : #FBVisitor,
	#superclass : #Object,
	#category : #'FingerBoard-Core-Base'
}

{ #category : #visiting }
FBVisitor >> visit: aFBObject [
	^ aFBObject acceptFingerBoard: self
]

{ #category : #visiting }
FBVisitor >> visitAll: aCollection [ 
	^ aCollection collect: [ :each |
		self visit: each ]
]

{ #category : #visiting }
FBVisitor >> visitFlow: aFBFlow [ 
	^ self visit: aFBFlow start
]

{ #category : #visiting }
FBVisitor >> visitNode: aFBNode [
	self visitAll: aFBNode outgoing.
	^ aFBNode 
]

{ #category : #visiting }
FBVisitor >> visitStartEvent: aFBStartEvent [ 
	^ self visitNode: aFBStartEvent 
]

{ #category : #visiting }
FBVisitor >> visitTransition: aFBTransition [ 
	^ self visitNode: aFBTransition target
]
