Class {
	#name : #BaselineOfFingerBoard,
	#superclass : #BaselineOf,
	#category : #BaselineOfFingerBoard
}

{ #category : #baselines }
BaselineOfFingerBoard >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec 
			package: 'FingerBoard-Core' with: [ 
				spec requires: #() ];
			package: 'FingerBoard-Core-Tests' with: [ 
				spec requires: #('FingerBoard-Core') ];
			package: 'FingerBoard-Roassal' with: [ 
				spec requires: #() ].
			
		spec 
			group: 'Core' with: #('FingerBoard-Core' 'FingerBoard-Core-Tests');
			group: 'Dev' with: #( 'Core' 'FingerBoard-Roassal' );
			group: 'default' with: #( 'Dev' ) ]
]
