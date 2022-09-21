Class {
	#name : #FBTestTaskBehavior,
	#superclass : #FBTaskBehavior,
	#category : #'FingerBoard-Core-Tests'
}

{ #category : #'as yet unclassified' }
FBTestTaskBehavior class >> environmentSchema [ 
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
FBTestTaskBehavior >> execute [ 
	self environment 
		at: #status put: 200
	
]
