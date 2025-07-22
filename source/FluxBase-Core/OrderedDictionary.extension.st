Extension { #name : 'OrderedDictionary' }

{ #category : '*FluxBase-Core' }
OrderedDictionary >> asPropertySchema [
	| propertySchema |
	propertySchema := FBPropertySchema new.
	self keysAndValuesDo: [ :key :value |
		propertySchema 
			at: key put: value ].
	^ propertySchema
]
