Class {
	#name : #FBProperties,
	#superclass : #Object,
	#instVars : [
		'dictionary'
	],
	#category : #'FingerBoard-Core-Model'
}

{ #category : #accessing }
FBProperties >> at: key [ 
	^ dictionary at: key
]

{ #category : #accessing }
FBProperties >> at: key ifAbsent: aBlock [
	^ dictionary at: key ifAbsent: aBlock
]

{ #category : #accessing }
FBProperties >> at: key put: anObject [
	dictionary 
		at: key
		put: anObject 
]

{ #category : #initialization }
FBProperties >> initialize [ 
	super initialize.
	dictionary := OrderedDictionary new.
]
