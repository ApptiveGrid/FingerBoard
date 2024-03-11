Class {
	#name : #FBPluggableTask,
	#superclass : #FBTask,
	#instVars : [
		'block'
	],
	#category : #'FingerBoard-Core-Model'
}

{ #category : #accessing }
FBPluggableTask >> block [

	^ block
]

{ #category : #accessing }
FBPluggableTask >> block: anObject [

	block := anObject
]

{ #category : #'as yet unclassified' }
FBPluggableTask >> evaluateTo: aString [ 
	self
		block: [ :activation |
			activation value: (activation asScriptScopeDuring: [ :scope |  aString asApptiveScript valueIn: scope ]) ]
]

{ #category : #'instance creation' }
FBPluggableTask >> executeWith: anObject [ 	
	^ block cull: anObject.
	
]

{ #category : #initialization }
FBPluggableTask >> initialize [ 
	super initialize.
	block := [  ]
]

{ #category : #'as yet unclassified' }
FBPluggableTask >> postProcessActivation: anActivation [ 
	anActivation 
		done;
		followAll: self outgoing
]

{ #category : #accessing }
FBPluggableTask >> value: anInteger [ 
	block := [ :activation | activation value: anInteger  ]
]
