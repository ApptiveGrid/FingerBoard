Extension { #name : #FBTask }

{ #category : #'*FingerBoard-Roassal' }
FBTask >> asRoassalShape [
	^ RSBox new 
		size: 100;
		color: (Color orange alpha: 0.5);
		cornerRadius: 15;
		model: self;
		yourself
]
