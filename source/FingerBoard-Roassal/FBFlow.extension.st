Extension { #name : #FBFlow }

{ #category : #'*FingerBoard-Roassal' }
FBFlow >> flowRoassalScript [
	^ [ :canvas | | allNodes |
		self halt.
		allNodes := self allNodes.
		allNodes do: [ :each | 
			canvas add: (each asRoassalShape @ RSLabeled @ RSDraggable @ RSPopup ) ].
			
		RSEdgeBuilder arrowedLine
			canvas: canvas;
			objects: allNodes;
			withBorderAttachPoint;
			connectFrom: #yourself 
			toAll: [ :e |
				e outgoing collect: #target ].
		

		RSHorizontalTreeLayout on: canvas nodes.
		canvas @ RSCanvasController.
		canvas  ]
]

{ #category : #'*FingerBoard-Roassal' }
FBFlow >> flowRoassalScriptO [
	^ [ :canvas | | nodes allNodes |
		allNodes := self allFlowElements.
		nodes := allNodes select: [ :each | each respondsTo: #basetype ].
		nodes do: [ :node | | element |
			
		(node basetype = #Event) ifTrue: [  
			element := RSEllipse new 
				size: 100; 
				color: (Color red alpha: 0.5);
				model: node;
				yourself.
			element @ RSLabeled @ RSDraggable @ RSPopup.
			canvas add: element ].
	
		(node basetype = #Activity) ifTrue: [  
			element := RSBox new 
				size: 100;
				color: (Color orange alpha: 0.5);
				cornerRadius: 15;
				model: node;
				yourself.
			element @ RSLabeled @ RSPopup @ RSDraggable.
			canvas add: element.
		].

		(node basetype = #Gateway) ifTrue: [  
			element := RSPolygon new
				points: (Array with: 0 @ 0 with: 70 @ 50 with: 0 @ 100 with: -70 @ 50);
				color: (Color blue alpha: 0.5);
				model: node;
				yourself.
			element @ RSLabeled @ RSPopup @ RSDraggable.
			canvas add: element ].
			
		RSEdgeBuilder arrowedLine
			canvas: canvas;
			objects: allNodes;
			withBorderAttachPoint;
			connectFrom: #yourself 
			toAll: [ :e |
				e outgoingFlows collect: #targetRef ].
		

		RSHorizontalTreeLayout on: canvas nodes.
		canvas @ RSCanvasController.
		canvas  ]]
]

{ #category : #'*FingerBoard-Roassal' }
FBFlow >> inspectionFlow [
	<inspectorPresentationOrder: 0 title: 'flow'>
	
	^ SpRoassalPresenter new 
		script: self flowRoassalScript
		yourself
]
