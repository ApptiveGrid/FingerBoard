Extension { #name : #Array }

{ #category : #'*FingerBoard-Core' }
Array >> asPropertySchema [
	^ self asOrderedDictionary asPropertySchema
]
