endpoints
timeline: name with: count andMax: ID
	| url response|
	
	url := STTwitterApi apiUrl, '/1.1/statuses/', name, '_timeline.json','?count=',count, '&max_id=', ID.
	response := self webClient 
					httpGet: url
					do: [:req | WebUtils
						oAuthSign: req
						url: url
						using: self accessTokenParams].
	response isSuccess 
		ifTrue: [^ STResult value: (self deserialize: (response content) intoCollectionOf: STTweet)] 
		ifFalse: [^ STResult error: (self deserialize: (response content) intoObjectOf: STError)].