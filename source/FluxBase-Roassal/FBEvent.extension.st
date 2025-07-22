Extension { #name : 'FBEvent' }

{ #category : '*FluxBase-Roassal' }
FBEvent >> asRoassalShape [
	^ RSEllipse new 
		size: 30; 
		color: (Color black alpha: 0.8);
		model: self;
		yourself.
]
