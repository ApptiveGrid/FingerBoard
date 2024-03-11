Class {
	#name : #FBTestTaskBehavior,
	#superclass : #FBTaskBehavior,
	#category : #'FingerBoard-Core-Tests'
}

{ #category : #'as yet unclassified' }
FBTestTaskBehavior class >> metadataSchema [ 
	^ { 
		#status -> FBPropertyType string.
		#pid -> FBPropertyType number  } asPropertySchema
]

{ #category : #'as yet unclassified' }
FBTestTaskBehavior class >> propertySchema [ 
	^ { 
		#name -> FBPropertyType string.
		#age -> FBPropertyType number  } asPropertySchema
]

{ #category : #execution }
FBTestTaskBehavior >> executeWith: anObject [ 
	self metadata 
		at: #status put: 200
	
]

{ #category : #execution }
FBTestTaskBehavior >> postProcessActivation: anActivation [ 
	anActivation metadata 
		at: #status put: 200
	
]
