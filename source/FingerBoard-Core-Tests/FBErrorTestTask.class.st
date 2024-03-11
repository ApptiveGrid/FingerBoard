Class {
	#name : #FBErrorTestTask,
	#superclass : #FBTask,
	#category : #'FingerBoard-Core-Tests'
}

{ #category : #execution }
FBErrorTestTask >> executeWith: anObject [ 
	^ self value 
]

{ #category : #accessing }
FBErrorTestTask >> value [
	^ [ 1/0 ]
		on: Error 
	 	do: [ :error | FBError signal: 'execution went wrong' ]
]
