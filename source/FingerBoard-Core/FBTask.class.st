Class {
	#name : 'FBTask',
	#superclass : 'FBActivity',
	#category : 'FingerBoard-Core-Model',
	#package : 'FingerBoard-Core',
	#tag : 'Model'
}

{ #category : 'accessing' }
FBTask >> defaultBehaviorClass [
	^ FBTaskBehavior
]
