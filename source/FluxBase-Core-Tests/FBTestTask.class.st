Class {
	#name : 'FBTestTask',
	#superclass : 'FBTask',
	#category : 'FluxBase-Core-Tests',
	#package : 'FluxBase-Core-Tests'
}

{ #category : 'accessing' }
FBTestTask >> value [
	^ 10 atRandom 
]
