Class {
	#name : 'FBSystemErrorTestTask',
	#superclass : 'FBTask',
	#category : 'FluxBase-Core-Tests',
	#package : 'FluxBase-Core-Tests'
}

{ #category : 'accessing' }
FBSystemErrorTestTask >> value [
	^ 1/0
]
