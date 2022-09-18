Class {
	#name : #FBEnvironment,
	#superclass : #Object,
	#instVars : [
		'activation',
		'properties'
	],
	#category : #'FingerBoard-Core-Model'
}

{ #category : #accessing }
FBEnvironment >> activation: aFBActivation [ 
	activation := aFBActivation 
]

{ #category : #accessing }
FBEnvironment >> at: key [ 
	^ properties at: key 
]

{ #category : #accessing }
FBEnvironment >> at: key put: anObject [ 
	properties at: key put: anObject 
]

{ #category : #initialization }
FBEnvironment >> initialize [ 
	super initialize.
	properties := Dictionary new
]

{ #category : #accessing }
FBEnvironment >> previous [
	^ activation previous environment 
]

{ #category : #printing }
FBEnvironment >> printOn: aStream [ 
	aStream << 'env: '.
	properties printOn: aStream
]
