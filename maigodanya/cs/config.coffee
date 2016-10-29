class Config
	constructor: ->
		@levelInit = 1
		@numberCatsInit = 20
		@timeCountdownInit = 20

	saveLastScore: (@value) ->
		localStorage.setItem(Config.LAST_SCORE, @value)

	saveHighScore: (@value) ->
		localStorage.setItem(Config.HIGHEST_SCORE, @value)

	setValues: ->
		localStorage.setItem(Config.LEVEL, @levelInit)
		localStorage.setItem(Config.NUMBER_CATS, @numberCatsInit)
		localStorage.setItem(Config.TIME_COUNTDOWN, @timeCountdownInit)

	getHighScore: ->
		'10:20'

config = new Config

Config.LEVEL = "level"
Config.NUMBER_CATS = "cats"
Config.TIME_COUNTDOWN = "times"
Config.LAST_SCORE = "last_score"
Config.HIGHEST_SCORE = "high_score"
