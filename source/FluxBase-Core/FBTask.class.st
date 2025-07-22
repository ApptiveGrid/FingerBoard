Class {
	#name : 'FBTask',
	#superclass : 'FBActivity',
	#category : 'FluxBase-Core-Model',
	#package : 'FluxBase-Core',
	#tag : 'Model'
}

{ #category : 'accessing' }
FBTask >> defaultBehaviorClass [
	^ FBTaskBehavior
]
