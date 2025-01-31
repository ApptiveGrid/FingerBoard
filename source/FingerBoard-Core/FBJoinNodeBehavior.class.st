Class {
	#name : 'FBJoinNodeBehavior',
	#superclass : 'FBNodeBehavior',
	#category : 'FingerBoard-Core-Model',
	#package : 'FingerBoard-Core',
	#tag : 'Model'
}

{ #category : 'execution' }
FBJoinNodeBehavior >> execute [ 
	| executor |
	executor := activation flowInstance executor.
	executor atEnd ifTrue: [ 
		executor stop .
		activation values: activation arguments.
		activation followAllOutgoing ]
]
