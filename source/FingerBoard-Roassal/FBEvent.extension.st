Extension { #name : #FBEvent }

{ #category : #'*FingerBoard-Roassal' }
FBEvent >> asRoassalShape [
	^ RSEllipse new 
		size: 100; 
		color: (Color red alpha: 0.5);
		model: self;
		yourself.
]
