as yet unclassified
loadView: aView as: aSymbol activate: aButton 
	(loadedViews includesKey: aSymbol) ifFalse: [
		loadedViews at: aSymbol put: (aView).
	].
	menuMorph activeButton: aButton.
	self updateViewMorph: (loadedViews at: aSymbol).