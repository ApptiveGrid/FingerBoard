Class {
	#name : #FBFlowEvent,
	#superclass : #Object,
	#category : #'FingerBoard-Core-Event'
}

{ #category : #testing }
FBFlowEvent class >> handlesAnnouncement: anAnnouncement [
	^ anAnnouncement class includesBehavior: self 
]

{ #category : #conversion }
FBFlowEvent >> asAnnouncement [
	^ self
]

{ #category : #initialization }
FBFlowEvent >> prepareForDelivery [
	"nothing to do"
]
