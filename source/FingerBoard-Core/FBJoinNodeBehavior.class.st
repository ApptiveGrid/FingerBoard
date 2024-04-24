Class {
	#name : #FBJoinNodeBehavior,
	#superclass : #FBNodeBehavior,
	#category : #'FingerBoard-Core-Model'
}

{ #category : #execution }
FBJoinNodeBehavior >> execute [ 
	| executor |
	executor := activation flowInstance currentExecutor.
	executor atEnd ifTrue: [ 
		executor stop .
		activation values: activation arguments.
		activation followAllOutgoing ]
]
