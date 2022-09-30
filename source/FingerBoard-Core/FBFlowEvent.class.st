Class {
	#name : #FBFlowEvent,
	#superclass : #Object,
	#instVars : [
		'timestamp'
	],
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

{ #category : #accessing }
FBFlowEvent >> name [

	^ self subclassResponsibility 
]

{ #category : #initialization }
FBFlowEvent >> prepareForDelivery [
	"nothing to do"
]

{ #category : #accessing }
FBFlowEvent >> setTimestamp [

	timestamp := DateAndTime now
]

{ #category : #accessing }
FBFlowEvent >> timestamp [

	^ timestamp
]
