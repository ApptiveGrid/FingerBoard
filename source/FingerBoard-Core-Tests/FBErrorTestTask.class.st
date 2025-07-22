Class {
	#name : 'FBErrorTestTask',
	#superclass : 'FBTask',
	#category : 'FingerBoard-Core-Tests',
	#package : 'FingerBoard-Core-Tests'
}

{ #category : 'accessing' }
FBErrorTestTask >> value [
	^ [ 1/0 ]
		on: Error 
	 	do: [ :error | FBError signal: 'execution went wrong' ]
]
