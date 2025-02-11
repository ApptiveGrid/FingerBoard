Class {
	#name : 'FBFlowEvent',
	#superclass : 'Object',
	#instVars : [
		'timestamp'
	],
	#category : 'FingerBoard-Core-Event',
	#package : 'FingerBoard-Core',
	#tag : 'Event'
}

{ #category : 'testing' }
FBFlowEvent class >> handlesAnnouncement: anAnnouncement [
	^ anAnnouncement class includesBehavior: self 
]

{ #category : 'conversion' }
FBFlowEvent >> asAnnouncement [
	^ self
]

{ #category : 'accessing' }
FBFlowEvent >> initialize [

	super initialize.
	timestamp := DateAndTime now
]

{ #category : 'accessing' }
FBFlowEvent >> logTrace [

	^ self subclassResponsibility 
]

{ #category : 'accessing' }
FBFlowEvent >> message [

	^ self subclassResponsibility 
]

{ #category : 'accessing' }
FBFlowEvent >> name [

	^ self subclassResponsibility 
]

{ #category : 'initialization' }
FBFlowEvent >> prepareForDelivery [
	"nothing to do"
]

{ #category : 'accessing' }
FBFlowEvent >> timestamp [

	^ timestamp
]

{ #category : 'accessing' }
FBFlowEvent >> type [

	^ self subclassResponsibility 
]
