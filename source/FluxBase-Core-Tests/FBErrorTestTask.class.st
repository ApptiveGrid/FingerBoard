Class {
	#name : 'FBErrorTestTask',
	#superclass : 'FBTask',
	#category : 'FluxBase-Core-Tests',
	#package : 'FluxBase-Core-Tests'
}

{ #category : 'accessing' }
FBErrorTestTask >> value [
	^ [ 1/0 ]
		on: Error 
	 	do: [ :error | FBError signal: 'execution went wrong' ]
]
