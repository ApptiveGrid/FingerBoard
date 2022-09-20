Class {
	#name : #FBTestTaskBehavior,
	#superclass : #FBTaskBehavior,
	#category : #'FingerBoard-Core-Tests'
}

{ #category : #'as yet unclassified' }
FBTestTaskBehavior class >> propertySchema [ 
	^ { 
		#name -> FBPropertyType string.
		#age -> FBPropertyType number  } asPropertySchema
]
