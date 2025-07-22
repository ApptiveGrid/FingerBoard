Extension { #name : 'Array' }

{ #category : '*FluxBase-Core' }
Array >> asPropertySchema [
	^ self asOrderedDictionary asPropertySchema
]
