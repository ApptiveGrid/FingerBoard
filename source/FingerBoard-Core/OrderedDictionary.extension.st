Extension { #name : 'OrderedDictionary' }

{ #category : '*FingerBoard-Core' }
OrderedDictionary >> asPropertySchema [
	| propertySchema |
	propertySchema := FBPropertySchema new.
	self keysAndValuesDo: [ :key :value |
		propertySchema 
			at: key put: value ].
	^ propertySchema
]
