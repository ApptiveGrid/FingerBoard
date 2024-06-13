Class {
	#name : #FBParallelNodeBehavior,
	#superclass : #FBNodeBehavior,
	#category : #'FingerBoard-Core-Behavior'
}

{ #category : #execution }
FBParallelNodeBehavior >> execute [

	(activation argument isCollection and: [
		 activation argument isSequenceable ]) ifFalse: [
		FBError signal:
			'Input for parallel execution has to be a non empty collection.' ].
	activation argument size > 0 ifFalse: [ ^ self ].
	activation flowInstance pushExecutor: (FBParallelExecutor new
			 node: activation node;
			 list: activation argument).
	activation value: activation argument.
	activation flowInstance executor stop
]
