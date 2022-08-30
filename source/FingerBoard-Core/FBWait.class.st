Class {
	#name : #FBWait,
	#superclass : #FBNode,
	#category : #'FingerBoard-Core'
}

{ #category : #converting }
FBWait >> asRoassalShape [
	^ RSBox new 
		size: 50;
		color: (Color green );
		cornerRadius: 0;
		model: self;
		yourself
]
