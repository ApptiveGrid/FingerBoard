Extension { #name : #FBTask }

{ #category : #'*FingerBoard-Roassal' }
FBTask >> asRoassalShape [
	^ RSBox new 
		size: 100;
		color: (Color lightOrange);
		cornerRadius: 15;
		model: self;
		yourself
]
