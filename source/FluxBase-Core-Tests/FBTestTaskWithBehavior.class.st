Class {
	#name : 'FBTestTaskWithBehavior',
	#superclass : 'FBTask',
	#category : 'FluxBase-Core-Tests',
	#package : 'FluxBase-Core-Tests'
}

{ #category : 'accessing' }
FBTestTaskWithBehavior >> defaultBehaviorClass [ 
	^ FBTestTaskBehavior 
]

{ #category : 'accessing' }
FBTestTaskWithBehavior >> value [
	^ 10 atRandom 
]
