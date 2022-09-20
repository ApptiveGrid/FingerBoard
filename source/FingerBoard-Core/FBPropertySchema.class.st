Class {
	#name : #FBPropertySchema,
	#superclass : #Object,
	#instVars : [
		'properties'
	],
	#category : #'FingerBoard-Core'
}

{ #category : #accessing }
FBPropertySchema >> at: key [ 
	^ properties at: key
]

{ #category : #accessing }
FBPropertySchema >> at: key put: aType [ 
	^ properties at: key put: aType 
]

{ #category : #accessing }
FBPropertySchema >> initialize [ 
	super initialize.
	properties := OrderedDictionary new
]

{ #category : #accessing }
FBPropertySchema >> keys [
	^ properties keys
]
