Class {
	#name : #FBParallelNodeBehavior,
	#superclass : #FBNodeBehavior,
	#category : #'FingerBoard-Core-Behavior'
}

{ #category : #execution }
FBParallelNodeBehavior >> execute [ 
	activation flowInstance pushExecutor: (FBParallelExecutor new 
		node: activation node;
		list: activation argument ).
	activation value: activation argument 
]
