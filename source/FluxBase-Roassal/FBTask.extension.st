Extension { #name : 'FBTask' }

{ #category : '*FluxBase-Roassal' }
FBTask >> asRoassalShape [
	^ (RSBox new 
		size: 100;
		color: (Color lightOrange);
		cornerRadius: 15;
		model: self;
		yourself) @ (RSLabeled new text: name; middle ;fontSize: 6; lowColor: Color black ) 
]
