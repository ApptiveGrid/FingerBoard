Class {
	#name : #BaselineOfFingerBoard,
	#superclass : #BaselineOf,
	#category : #BaselineOfFingerBoard
}

{ #category : #baselines }
BaselineOfFingerBoard >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec 
			package: 'FingerBoard-Core' with: [ 
				spec requires: #() ];
			package: 'FingerBoard-Core-Tests' with: [ 
				spec requires: #('FingerBoard-Core') ].
			
		spec 
			group: 'Core' with: #('FingerBoard-Core' 'FingerBoard-Core-Tests');
			group: 'default' with: #( 'Core' ) ]
]

{ #category : #'as yet unclassified' }
BaselineOfFingerBoard >> jsonSchema: spec [
	
	spec baseline: 'JSONSchema' with: [ 
		spec 
			repository: 'github://zweidenker/JSONSchema/source' ]
]

{ #category : #'as yet unclassified' }
BaselineOfFingerBoard >> jsonWebToken: spec [
	
	spec baseline: 'JSONWebToken' with: [ 
		spec 
			repository: 'github://noha/JSONWebToken:pharo9-openssl1.1/source' ]
]

{ #category : #'as yet unclassified' }
BaselineOfFingerBoard >> metrics: spec [
	
	spec baseline: 'Metrics' with: [ 
		spec 
			repository: 'github://zweidenker/pharo-metrics:development/source']
]

{ #category : #'as yet unclassified' }
BaselineOfFingerBoard >> microdown: spec [
	
	spec baseline: 'Microdown' with: [ 
		spec 
			repository: 'github://pillar-markup/MicroDown';
			loads: #( 'Microdown-Pillar') ]
]

{ #category : #'as yet unclassified' }
BaselineOfFingerBoard >> monibase: spec [
	
	spec baseline: 'MoniBase' with: [ 
		spec 
			repository: 'github://ApptiveGrid/MoniBase:36625e0a9730a322448c30017dc2f5bfbc1d99b4/src' ]
]

{ #category : #'as yet unclassified' }
BaselineOfFingerBoard >> neoCsv: spec [
	
	spec baseline: 'NeoCSV' with: [ 
		spec 
			repository: 'github://svenvc/NeoCSV/repository']
]

{ #category : #'as yet unclassified' }
BaselineOfFingerBoard >> ogc: spec [

	spec
		baseline: 'OGC' with: [
			spec 
				repository: 'github://pharo-GIS/OGC-Pharo';loads: #(Geometric Spheric)]
				
]

{ #category : #'as yet unclassified' }
BaselineOfFingerBoard >> openssl: spec [
	
	spec baseline: 'OpenSSL' with: [ 
		spec 
			repository: 'github://PierceNg/OpenSSL:openssl_1_1_pharo9/source' ]
]

{ #category : #'as yet unclassified' }
BaselineOfFingerBoard >> snapdump: spec [
	
	spec baseline: 'SnapDump' with: [ 
		spec 
			repository: 'github://zweidenker/SnapDump:development/source';
			loads: #( 'handler' )]
]

{ #category : #baselines }
BaselineOfFingerBoard >> zinc: spec [
	spec baseline: 'ZincHTTPComponents' with: [ 
		spec 
			loads: #('REST' 'Zinc-HTTP-Examples');
			repository: 'github://svenvc/zinc/repository']
]
