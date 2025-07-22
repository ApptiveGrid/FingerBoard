Class {
	#name : 'FBWait',
	#superclass : 'FBNode',
	#category : 'FluxBase-Core-Model',
	#package : 'FluxBase-Core',
	#tag : 'Model'
}

{ #category : 'converting' }
FBWait >> asRoassalShape [
	^ RSBox new 
		size: 50;
		color: (Color green );
		cornerRadius: 0;
		model: self;
		yourself
]
