class ResultScene
	constructor: (@resultStatus, @playingSecs, @playingMiliSecs) ->
		@scene = new Scene

		# Background Images array
		#@nextBgImageIndex = 0
		#@bgImages = for i in [1..ResultScene.NUMBERS_BACKGROUND_IMAGES]
		#	jsg.loadImage("maigodanya/images/result/resultbgImg0#{i}.png")
		#@bgSprite = new Sprite(@bgImages[0].width, @bgImages[0].height)
		@bgSprite = new ImageView('maigodanya/images/result/resultbgImg01.png')
		@bgSprite.prescale()
		@scene.center(@bgSprite)
		@scene.add(@bgSprite)

		# Back Top button
		@backTopButton = new ImageButton(
			'maigodanya/images/buttons/pausetopImg.png',
			'maigodanya/images/buttons/pausetopImg.png',
			@onTopButton
		)
		@backTopButton.prescale()
		@backTopButton.width = @backTopButton.width * 0.8
		@backTopButton.height = @backTopButton.height * 0.8
		@backTopButton.offsetX = 0.5
		@backTopButton.offsetY = 0.5
		@backTopButton.x = @scene.width / 2
		@backTopButton.y = @scene.height * 0.55
		@scene.add(@backTopButton)

		# Restart button
		@restartButton = new ImageButton(
			'maigodanya/images/buttons/pauserestartImg.png',
			'maigodanya/images/buttons/pauserestartImg.png',
			@onRestartButton
		)
		@restartButton.prescale()
		@restartButton.width = @restartButton.width * 0.8
		@restartButton.height = @restartButton.height * 0.8
		@restartButton.offsetX = 0.5
		@restartButton.offsetY = 0.5
		@restartButton.x = @scene.width / 2
		@restartButton.y = @scene.height * 0.65
		@scene.add(@restartButton)

		@winningRibbon = new ImageView('maigodanya/images/game/finish.png')
		@winningRibbon.prescale()
		@winningRibbon.width = @winningRibbon.width * 0.8
		@winningRibbon.height = @winningRibbon.height * 0.8
		@winningRibbon.offsetX = 0.5
		@winningRibbon.offsetY = 0.5
		@winningRibbon.x = @scene.width * 1.5
		@winningRibbon.y = @scene.height * 0.8
		@scene.add(@winningRibbon)

		@timeOverRibbon = new ImageView('maigodanya/images/game/timeover.png')
		@timeOverRibbon.prescale()
		@timeOverRibbon.width = @timeOverRibbon.width * 0.8
		@timeOverRibbon.height = @timeOverRibbon.height * 0.8
		@timeOverRibbon.offsetX = 0.5
		@timeOverRibbon.offsetY = 0.5
		@timeOverRibbon.x = @scene.width * 1.5
		@timeOverRibbon.y = @scene.height * 0.8
		@scene.add(@timeOverRibbon)

		# components animation
		componentAnimation = new ResultComponents(@scene, 2, @resultStatus, @playingSecs, @playingMiliSecs)
		componentAnimation.show()

		# Key pressed
		$(window).keypress((event) =>
			if (!@scene.active) 									then return
			if (event.which == '1'.charCodeAt(0)) then @onTopButton()
			if (event.which == '2'.charCodeAt(0)) then @onRestartButton()
		)

		# Keyboard images
		@numberOneKey = new Keyboard(@scene, 1, @scene.width * 0.3, @backTopButton.y)
		@numberTwoKey = new Keyboard(@scene, 2, @scene.width * 0.3, @restartButton.y)

	playBackgroundAnimation: =>
		@bgSprite.updateImageFit(@bgImages[@nextBgImageIndex])

		@nextBgImageIndex++

		@nextBgImageIndex = 0 if @nextBgImageIndex >= ResultScene.NUMBERS_BACKGROUND_IMAGES

	playWinningRibbonAnimation: =>
		new TWEEN.Tween(@winningRibbon).to(
			{x: @scene.width / 2, y: @scene.height * 0.8},
			1200
		).easing(
			TWEEN.Easing.Quadratic.Out
		).onComplete(=>
		).start()

	playGameOverRibbonAnimation: =>
		new TWEEN.Tween(@timeOverRibbon).to(
			{x: @scene.width / 2, y: @scene.height * 0.8},
			1200
		).easing(
			TWEEN.Easing.Quadratic.Out
		).onComplete(=>
		).start()

  highScoreProcess: ->
  	@currentHighscore = config.getHighScore()

	show: ->
		@scene.show()
		@timeId = jsg.setInterval(@playThemeSound, 140)
		# window.sounds.resultScene.playLoop()
		if @resultStatus == 1
			# code process the final result and displaying
			@playWinningRibbonAnimation()
		else
		 	@playGameOverRibbonAnimation()
		
	hide: ->
		@scene.hide()
		jsg.clearTimeout(@timeId)

	onTopButton: =>
		@hide()
		# window.sounds.resultScene.pause()
		window.location = 'index.html'

	onRestartButton: =>
		@hide()
		# window.sounds.resultScene.pause()
		playGame = window.playGameScene
		playGame.show()

	playThemeSound: =>
		window.gameSound['playgame'].play()

	ResultScene.NUMBERS_BACKGROUND_IMAGES = 6
	ResultScene.NUMBER_RIBBON_IMAGES = 4