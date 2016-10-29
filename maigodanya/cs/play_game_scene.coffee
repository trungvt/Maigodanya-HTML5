class PlayGameScene
	constructor: ->
		@scene = new Scene

		@isSceneActive = false

		# common variables
		@numbersOfCat = 30
		@currentRemainingCats = @numbersOfCat

		# init the array of lost cats (random initializing)
		@arrayAllCats = for i in [1..@numbersOfCat]
			Math.floor(Math.random() * 4) + 1
		@currentWantedCatIndex = 0

		# Background Images array
		#@nextBgImageIndex = 0
		#@bgImages = for i in [1..PlayGameScene.NUMBERS_BACKGROUND_IMAGES]
		#	jsg.loadImage("maigodanya/images/game/backgameImg0#{i}.png")
		#@bgSprite = new Sprite(@bgImages[0].width, @bgImages[0].height)
		@bgSprite = new ImageView('maigodanya/images/game/backgameImg01.png')
		@bgSprite.prescale()
		@scene.center(@bgSprite)
		@scene.add(@bgSprite)

		# Wanted Cat board
		@wantedCatBoardBackground = new ImageView('maigodanya/images/wanted/wantedpaper.png')
		@wantedCatBoardBackground.prescale()
		#@wantedCatBoardBackground.width = @wantedCatBoardBackground.width * 0.7
		#@wantedCatBoardBackground.height = @wantedCatBoardBackground.height * 0.8
		@wantedCatBoardBackground.offsetX = 0.5
		@wantedCatBoardBackground.offsetY = 0.5
		@wantedCatBoardBackground.x = @scene.width / 2
		@wantedCatBoardBackground.y = @scene.height / 4
		@scene.add(@wantedCatBoardBackground)

		# Wanted Cat face
		@wantedCat = new ImageView("maigodanya/images/wanted/wanted0#{@arrayAllCats[@currentWantedCatIndex]}.png")
		@wantedCat.prescale()
		#@wantedCat.width = @wantedCat.width * 0.7
		#@wantedCat.height = @wantedCat.height * 0.8
		@wantedCat.offsetX = 0.5
		@wantedCat.offsetY = 0.5
		@wantedCat.x = @wantedCatBoardBackground.x
		@wantedCat.y = @wantedCatBoardBackground.y + @wantedCatBoardBackground.height * 0.1
		@scene.add(@wantedCat)

		# Pause button
		@pauseButton = new ImageButton(
			'maigodanya/images/buttons/pauseImgBtn.png',
			'maigodanya/images/buttons/pauseImgBtn.png',
			@onPauseButton
		)
		@pauseButton.width = @pauseButton.width * 0.9
		@pauseButton.height = @pauseButton.height * 0.9
		@pauseButton.offsetX = 0.5
		@pauseButton.offsetY = 0.5
		@pauseButton.x = @scene.width * 0.92
		@pauseButton.y = @scene.height * 0.92
		@scene.add(@pauseButton)

		# Brown Cat button
		@brownCatIndex = 0
		# @brownImgs = for i in [1..4]
		#	 jsg.loadImage("maigodanya/images/cats/brownneko_nomal0#{i}.png")
		@brownImgs = for i in [1..4]
			"maigodanya/images/cats/brownneko_nomal0#{i}.png"
		# @brownCatNormalSprite = new Sprite(@brownImgs[0].width, @brownImgs[0].height)
		@brownCatNormalSprite = new ImageView(@brownImgs[0])
		@brownCatNormalSprite.prescale()
		@brownCatNormalSprite.offsetY = 0.5
		@brownCatNormalSprite.offsetX = 0.5
		@brownCatNormalSprite.x = 0 - @brownCatNormalSprite.width
		@brownCatNormalSprite.y = @scene.height * 2 / 3
		@scene.add(@brownCatNormalSprite)
		@brownCatNormalSprite.touch.down(@onBrownCatButton)

		# Black Cat button
		@blackCatIndex = 0
		# @blackImgs = for i in [1..5]
		# 	 jsg.loadImage("maigodanya/images/cats/kuroneko_nomal0#{i}.png")
		@blackImgs = for i in [1..5]
			"maigodanya/images/cats/kuroneko_nomal0#{i}.png"
		# @blackCatNormalSprite = new Sprite(@blackImgs[0].width, @blackImgs[0].height)
		@blackCatNormalSprite = new ImageView(@blackImgs[0])
		@blackCatNormalSprite.prescale()
		@blackCatNormalSprite.offsetY = 0.5
		@blackCatNormalSprite.offsetX = 0.5
		@blackCatNormalSprite.x = @scene.width + @blackCatNormalSprite.width
		@blackCatNormalSprite.y = @scene.height * 2 / 3
		@scene.add(@blackCatNormalSprite)
		@blackCatNormalSprite.touch.down(@onBlackCatButton)

		# White Cat button
		@whiteCatIndex = 0
		# @whiteImgs = for i in [1..3]
		#	 jsg.loadImage("maigodanya/images/cats/shironeko_normal0#{i}.png")
		@whiteImgs = for i in [1..3]
			"maigodanya/images/cats/shironeko_normal0#{i}.png"
		# @whiteCatNormalSprite = new Sprite(@whiteImgs[0].width, @whiteImgs[0].height)
		@whiteCatNormalSprite = new ImageView(@whiteImgs[0])
		@whiteCatNormalSprite.prescale()
		@whiteCatNormalSprite.offsetY = 0.5
		@whiteCatNormalSprite.offsetX = 0.5
		@whiteCatNormalSprite.x = 0 - @whiteCatNormalSprite.width
		@whiteCatNormalSprite.y = @scene.height * 0.87
		@scene.add(@whiteCatNormalSprite)
		@whiteCatNormalSprite.touch.down(@onWhiteCatButton)

		# Gray Cat button
		@grayCatIndex = 0
		# @grayImgs = for i in [1..5]
		#	 jsg.loadImage("maigodanya/images/cats/grayneko_normal0#{i}.png")
		@grayImgs = for i in [1..5]
			"maigodanya/images/cats/grayneko_normal0#{i}.png"
		# @grayCatNormalSprite = new Sprite(@grayImgs[0].width, @grayImgs[0].height)
		@grayCatNormalSprite = new ImageView(@grayImgs[0])
		@grayCatNormalSprite.prescale()
		@grayCatNormalSprite.offsetY = 0.5
		@grayCatNormalSprite.offsetX = 0.5
		@grayCatNormalSprite.x = @scene.width + @grayCatNormalSprite.width
		@grayCatNormalSprite.y = @scene.height * 0.87
		@scene.add(@grayCatNormalSprite)
		@grayCatNormalSprite.touch.down(@onGrayCatButton)

		# init the numbers of lost cats
		@numberLostCats = new NumberCatsComponent(@scene)
		@numberLostCats.numberProcessing(@numbersOfCat)

		# init time values for timing countdown
		@tempStopTiming = 3
		@secs = 20 - 1
		@tempSecs = @secs
		@miliSecs = 90
		@tempMiliSecs = @miliSecs

		# init the time counting
		@secondsPosition1 = new ImageView
		@secondsPosition1.prescale()
		@secondsPosition1.offsetX = 0.5
		@secondsPosition1.offsetY = 0.5
		@secondsPosition1.x = @scene.width * 0.07
		@secondsPosition1.y = @scene.height * 0.2
		@scene.add(@secondsPosition1)

		@secondsPosition2 = new ImageView
		@secondsPosition2.prescale()
		@secondsPosition2.offsetX = 0.5
		@secondsPosition2.offsetY = 0.5
		@secondsPosition2.x = @scene.width * 0.11
		@secondsPosition2.y = @scene.height * 0.2
		@scene.add(@secondsPosition2)

		@colon = new ImageView('maigodanya/images/numbers/num_mm.png')
		@colon.prescale()
		@colon.offsetX = 0.5
		@colon.offsetY = 0.5
		@colon.x = @scene.width * 0.15
		@colon.y = @scene.height * 0.2
		@scene.add(@colon)

		@miliSecondsPosition1 = new ImageView
		@miliSecondsPosition1.prescale()
		@miliSecondsPosition1.offsetX = 0.5
		@miliSecondsPosition1.offsetY = 0.5
		@miliSecondsPosition1.x = @scene.width * 0.19
		@miliSecondsPosition1.y = @scene.height * 0.2
		@scene.add(@miliSecondsPosition1)

		@miliSecondsPosition2 = new ImageView
		@miliSecondsPosition2.prescale()
		@miliSecondsPosition2.offsetX = 0.5
		@miliSecondsPosition2.offsetY = 0.5
		@miliSecondsPosition2.x = @scene.width * 0.23
		@miliSecondsPosition2.y = @scene.height * 0.2
		@scene.add(@miliSecondsPosition2)

		# init the game with the beginning cat

		# setup cats list buffer
		#@nextRibbonImageIndex = 0
		#@ribbonImgs = for i in [1..PlayGameScene.NUMBERS_NEXT_RIBBON_IMAGES]
		#	jsg.loadImage("maigodanya/images/game/next_img#{i}.png")
		#@nextRibbon = new Sprite(@ribbonImgs[0].width, @ribbonImgs[0].height)
		@nextRibbon = new ImageView('maigodanya/images/game/next_img2.png')
		@nextRibbon.prescale()
		#@nextRibbon.width = @nextRibbon.width * 0.8
		#@nextRibbon.height = @nextRibbon.height * 0.8
		@nextRibbon.offsetX = 0.5
		@nextRibbon.offsetY = 0.5
		@nextRibbon.x = @scene.width * 0.9
		@nextRibbon.y = @scene.height * 0.1
		@scene.add(@nextRibbon)

		@bufferCat5 = new ImageView("maigodanya/images/cats/next_cat0#{@arrayAllCats[5]}.png")
		@bufferCat5.prescale()
		#@bufferCat5.width = @bufferCat5.width * 0.8
		#@bufferCat5.height = @bufferCat5.height * 0.8
		@bufferCat5.offsetX = 0.5
		@bufferCat5.offsetY = 0.5
		@bufferCat5.x = @scene.width * 0.9
		@bufferCat5.y = @scene.height * 0.48
		@scene.add(@bufferCat5)

		@bufferCat4 = new ImageView("maigodanya/images/cats/next_cat0#{@arrayAllCats[4]}.png")
		@bufferCat4.prescale()
		#@bufferCat4.width = @bufferCat4.width * 0.8
		#@bufferCat4.height = @bufferCat4.height * 0.8
		@bufferCat4.offsetX = 0.5
		@bufferCat4.offsetY = 0.5
		@bufferCat4.x = @scene.width * 0.9
		@bufferCat4.y = @scene.height * 0.40
		@scene.add(@bufferCat4)

		@bufferCat3 = new ImageView("maigodanya/images/cats/next_cat0#{@arrayAllCats[3]}.png")
		@bufferCat3.prescale()
		#@bufferCat3.width = @bufferCat3.width * 0.8
		#@bufferCat3.height = @bufferCat3.height * 0.8
		@bufferCat3.offsetX = 0.5
		@bufferCat3.offsetY = 0.5
		@bufferCat3.x = @scene.width * 0.9
		@bufferCat3.y = @scene.height * 0.32
		@scene.add(@bufferCat3)

		@bufferCat2 = new ImageView("maigodanya/images/cats/next_cat0#{@arrayAllCats[2]}.png")
		@bufferCat2.prescale()
		#@bufferCat2.width = @bufferCat2.width * 0.8
		#@bufferCat2.height = @bufferCat2.height * 0.8
		@bufferCat2.offsetX = 0.5
		@bufferCat2.offsetY = 0.5
		@bufferCat2.x = @scene.width * 0.9
		@bufferCat2.y = @scene.height * 0.24
		@scene.add(@bufferCat2)

		@bufferCat1 = new ImageView("maigodanya/images/cats/next_cat0#{@arrayAllCats[1]}.png")
		@bufferCat1.prescale()
		#@bufferCat1.width = @bufferCat1.width * 0.8
		#@bufferCat1.height = @bufferCat1.height * 0.8
		@bufferCat1.offsetX = 0.5
		@bufferCat1.offsetY = 0.5
		@bufferCat1.x = @scene.width * 0.9
		@bufferCat1.y = @scene.height * 0.16
		@scene.add(@bufferCat1)

		# Keyboard images
		@numberOneKey = new Keyboard(@scene, 1, @scene.width * 0.1, @scene.height * 0.6)
		@numberOneKey.setVisible(0)
		@numberTwoKey = new Keyboard(@scene, 2, @scene.width * 0.55, @scene.height * 0.6)
		@numberTwoKey.setVisible(0)
		@numberThreeKey = new Keyboard(@scene, 3, @scene.width * 0.1, @scene.height * 0.8)
		@numberThreeKey.setVisible(0)
		@numberFourKey = new Keyboard(@scene, 4, @scene.width * 0.55, @scene.height * 0.8)
		@numberFourKey.setVisible(0)

		# failed answer image
		@failedImage = new ImageView('maigodanya/images/game/wrong01.png')
		@failedImage.prescale()
		#@failedImage.width = @failedImage.width * 0.7
		#@failedImage.height = @failedImage.height * 0.7
		@failedImage.offsetX = 0.5
		@failedImage.offsetY = 0.5
		@failedImage.x = @scene.width / 2
		@failedImage.y = @scene.height / 2
		@scene.add(@failedImage)

		# Pause Background layer
		#@pauseBgImageIndex = 0
		#@pauseBgImages = for i in [1..PlayGameScene.NUMBER_PAUSE_BACKGROUND_IMAGES]
		#	jsg.loadImage("maigodanya/images/pause/pausebgImg0#{i}.png")
		#@pauseBgSprite = new Sprite(@pauseBgImages[0].width, @pauseBgImages[0].height)
		@pauseBgSprite = new ImageView('maigodanya/images/pause/pausebgImg02.png')
		@pauseBgSprite.prescale()
		@scene.center(@pauseBgSprite)
		@scene.add(@pauseBgSprite)

		# Continue buttons
		@continueButton = new ImageButton(
			'maigodanya/images/buttons/pausecontinueImg.png',
			'maigodanya/images/buttons/pausecontinueImg.png',
			@onContinueButton
		)
		@continueButton.prescale()
		@continueButton.width = @continueButton.width * 1
		@continueButton.height = @continueButton.height * 0.8
		@continueButton.offsetX = 0.5
		@continueButton.offsetY = 0.5
		@continueButton.x = @scene.width / 2
		@continueButton.y = @scene.height * 0.42
		@scene.add(@continueButton)

		# Back To Top buttons
		@backToTopButton = new ImageButton(
			'maigodanya/images/buttons/pausetopImg.png',
			'maigodanya/images/buttons/pausetopImg.png',
			@onBackTopButton
		)
		@backToTopButton.prescale()
		@backToTopButton.width = @backToTopButton.width * 1
		@backToTopButton.height = @backToTopButton.height * 0.8
		@backToTopButton.offsetX = 0.5
		@backToTopButton.offsetY = 0.5
		@backToTopButton.x = @scene.width / 2
		@backToTopButton.y = @scene.height * 0.52
		@scene.add(@backToTopButton)

		# Restart Game buttons
		@restartGameButton = new ImageButton(
			'maigodanya/images/buttons/pauserestartImg.png',
			'maigodanya/images/buttons/pauserestartImg.png',
			@onRestartButton
		)
		@restartGameButton.prescale()
		@restartGameButton.width = @restartGameButton.width * 1
		@restartGameButton.height = @restartGameButton.height * 0.8
		@restartGameButton.offsetX = 0.5
		@restartGameButton.offsetY = 0.5
		@restartGameButton.x = @scene.width / 2
		@restartGameButton.y = @scene.height * 0.62
		@scene.add(@restartGameButton)

		# On Game Over
		@gameOverSprite = new ImageView('maigodanya/images/game/timeover.png')
		@gameOverSprite.prescale()
		#@gameOverSprite.width = @gameOverSprite.width * 0.7
		#@gameOverSprite.height = @gameOverSprite.height * 0.7
		@gameOverSprite.offsetX = 0.5
		@gameOverSprite.offsetY = 0.5
		@gameOverSprite.x = @scene.width / 2
		@gameOverSprite.y = @scene.height / 2
		@scene.add(@gameOverSprite)

		# Ready ribbon
		@readyRibbon = new ImageView('maigodanya/images/game/ready.png')
		@readyRibbon.prescale()
		#@readyRibbon.width = @readyRibbon.width * 0.7
		#@readyRibbon.height = @readyRibbon.height * 0.7
		@readyRibbon.offsetX = 0.5
		@readyRibbon.offsetY = 0.5
		@readyRibbon.x = @scene.width * 1.5
		@readyRibbon.y = @scene.height / 2
		@scene.add(@readyRibbon)

		# Go ribbon
		@goRibbon = new ImageView('maigodanya/images/game/readygo.png')
		@goRibbon.prescale()
		#@goRibbon.width = @goRibbon.width * 0.7
		#@goRibbon.height = @goRibbon.height * 0.7
		@goRibbon.offsetX = 0.5
		@goRibbon.offsetY = 0.5
		@goRibbon.x = @scene.width / 2
		@goRibbon.y = 0 - @goRibbon.height
		@scene.add(@goRibbon)

		# Finish Ribbon
		@winningRibbon = new ImageView('maigodanya/images/game/finish.png')
		@winningRibbon.prescale()
		#@winningRibbon.width = @winningRibbon.width * 0.6
		#@winningRibbon.height = @winningRibbon.height * 0.6
		@winningRibbon.offsetX = 0.5
		@winningRibbon.offsetY = 0.5
		@winningRibbon.x = @scene.width * 1.5
		@winningRibbon.y = @scene.height * 0.9
		@scene.add(@winningRibbon)

		# Game Over Ribbon
		@gameOverRibbon = new ImageView('maigodanya/images/game/timeover.png')
		@gameOverRibbon.prescale()
		#@gameOverRibbon.width = @winningRibbon.width * 1
		#@gameOverRibbon.height = @winningRibbon.height * 1
		@gameOverRibbon.offsetX = 0.5
		@gameOverRibbon.offsetY = 0.5
		@gameOverRibbon.x = @scene.width * 1.5
		@gameOverRibbon.y = @scene.height * 0.9
		@scene.add(@gameOverRibbon)

		@numberFiveKey = new Keyboard(@scene, 5, @scene.width * 0.95, @scene.height * 0.85)
		@numberFiveKey.setVisible(0)
		@numberSixKey = new Keyboard(@scene, 6, @scene.width * 0.2, @scene.height * 0.4)
		@numberSixKey.setVisible(0)
		@numberSevenKey = new Keyboard(@scene, 7, @scene.width * 0.2, @scene.height * 0.5)
		@numberSevenKey.setVisible(0)
		@numberEightKey = new Keyboard(@scene, 8, @scene.width * 0.2, @scene.height * 0.6)
		@numberEightKey.setVisible(0)

	tempStopTime: =>
		#@goRibbon.visible = false
		#@pauseButton.visible = true

	playReadyRibbonAnimation: =>
    new TWEEN.Tween(@readyRibbon).to(
      {x: @scene.width / 2, y: @scene.height / 2},
      1200
    ).easing(
      TWEEN.Easing.Quadratic.Out
    ).onComplete(=>
    	@readyRibbon.visible = false
    	@goRibbon.visible = true
    	jsg.setTimeout(@tempStopTime, 1000)

    	# Brown Cat moving in
    	new TWEEN.Tween(@brownCatNormalSprite).to(
	      {x: @scene.width * 0.25, y: @scene.height * 2 / 3},
	      1200
	    ).easing(
	      TWEEN.Easing.Quadratic.Out
	    ).start()

	    # Black Cat moving in
    	new TWEEN.Tween(@blackCatNormalSprite).to(
	      {x: @scene.width * 0.74, y: @scene.height * 2 / 3},
	      1200
	    ).easing(
	      TWEEN.Easing.Quadratic.Out
	    ).start()

	    # White Cat moving in
    	new TWEEN.Tween(@whiteCatNormalSprite).to(
	      {x: @scene.width * 0.25, y: @scene.height * 0.87},
	      1200
	    ).easing(
	      TWEEN.Easing.Quadratic.Out
	    ).start()

	    # Gray Cat moving in
    	new TWEEN.Tween(@grayCatNormalSprite).to(
	      {x: @scene.width * 0.7, y: @scene.height * 0.87},
	      1200
	    ).easing(
	      TWEEN.Easing.Quadratic.Out
	    ).start()

    	# Go Ribbon
    	new TWEEN.Tween(@goRibbon).to(
	      {x: @scene.width / 2, y: @scene.height / 2},
	      1200
	    ).easing(
	      TWEEN.Easing.Bounce.Out
	    ).onComplete(=>
	    	@isSceneActive = true
	    	jsg.setTimeout(@tempStopTime, 1000)
	    	@goRibbon.visible = false
	    	@pauseButton.visible = true
	    	@timeoutId = jsg.setInterval(@timeCountdown, 100)

	    	@numberOneKey.setVisible(1)
	    	@numberTwoKey.setVisible(1)
	    	@numberThreeKey.setVisible(1)
	    	@numberFourKey.setVisible(1)
	    	@numberFiveKey.setVisible(1)

	    	# Key Pressed
	    	$(window).keypress((event) =>
	    		if (!@isSceneActive)									  then return
	    		if (event.which == '1'.charCodeAt(0) && !@isPaused)
	    			@onBrownCatButton()
	    		if (event.which == '2'.charCodeAt(0) && !@isPaused)
	    			@onBlackCatButton()
	    		if (event.which == '3'.charCodeAt(0) && !@isPaused)
	    			@onWhiteCatButton()
	    		if (event.which == '4'.charCodeAt(0) && !@isPaused)
	    			@onGrayCatButton()
	    		if (event.which == '5'.charCodeAt(0) && !@isPaused)
	    			@onPauseButton()
	    		if (event.which == '6'.charCodeAt(0) && @isPaused)
	    			@onContinueButton()
	    		if (event.which == '7'.charCodeAt(0) && @isPaused)
	    			@onBackTopButton()
	    		if (event.which == '8'.charCodeAt(0) && @isPaused)
	    			@onRestartButton()
	    		if @currentRemainingCats > 0
	    			event.which = -1
	    	)
	    ).start()
    ).start()

	playMainAnimations: =>
		@bgSprite.updateImageFit(@bgImages[@nextBgImageIndex])
		@nextRibbon.updateImageFit(@ribbonImgs[@nextRibbonImageIndex])

		@nextBgImageIndex++
		@nextRibbonImageIndex++

		@nextBgImageIndex = 0 if @nextBgImageIndex >= PlayGameScene.NUMBERS_BACKGROUND_IMAGES
		@nextRibbonImageIndex = 0 if @nextRibbonImageIndex >= PlayGameScene.NUMBERS_NEXT_RIBBON_IMAGES

	playPauseAnimation: =>
		@pauseBgSprite.updateImageFit(@pauseBgImages[@pauseBgImageIndex])

		@pauseBgImageIndex++

		@pauseBgImageIndex = 0 if @pauseBgImageIndex >= PlayGameScene.NUMBER_PAUSE_BACKGROUND_IMAGES

	timeCountdown: =>
		@colon.visible = true
		window.gameSound['playgame'].play()
		if @miliSecs == 0
			if @secs == 0
				jsg.clearTimeout(@timeoutId)

				# move to Result Scene
				if @currentRemainingCats > 0
					@isSceneActive = false
					@isPaused = false
					@gameOverRibbon.visible = true
					# window.sounds.endGame.play()
					@playEndingRibbonAnimation(@gameOverRibbon, 0)
			if @secs > 0
				@miliSecs = 90
				@secs--
		else
			@miliSecs -= 10
		
		@secondsArray = ["", ""]
		@secondsArray = "#{@secs}".split ""
		if @secs < 10
			@secondsPosition1.setImage("maigodanya/images/numbers/num_s-0.png")
			@secondsPosition2.setImage("maigodanya/images/numbers/num_s-#{@secondsArray[0]}.png")
		else
			@secondsPosition1.setImage("maigodanya/images/numbers/num_s-#{@secondsArray[0]}.png")
			@secondsPosition2.setImage("maigodanya/images/numbers/num_s-#{@secondsArray[1]}.png")
		
		@miliSecondsArray = ["", ""]
		@miliSecondsArray = "#{@miliSecs}".split ""
		if @miliSecs < 10
			@miliSecondsPosition1.setImage("maigodanya/images/numbers/num_s-0.png")
			@miliSecondsPosition2.setImage("maigodanya/images/numbers/num_s-#{@miliSecondsArray[0]}.png")
		else 
			@miliSecondsPosition1.setImage("maigodanya/images/numbers/num_s-#{@miliSecondsArray[0]}.png")
			@miliSecondsPosition2.setImage("maigodanya/images/numbers/num_s-#{@miliSecondsArray[1]}.png")

	pauseTimeCountdown: =>
		jsg.clearTimeout(@timeoutId)

	resumeTimeCountdown: =>
		@timeoutId = jsg.setTimeout(@timeCountdown, 10)

	playEndingRibbonAnimation: (@ribbon, @status) =>
		new TWEEN.Tween(@ribbon).to(
      {x: @scene.width / 2, y: @scene.height / 2},
      1200
    ).easing(
      TWEEN.Easing.Quadratic.Out
    ).onComplete(=>
    	@hide()
    	if @status == 1
	    	@winGame = new ResultScene(1, @tempSecs - @secs, @tempMiliSecs - @miliSecs)
	    	@winGame.show()
	    else
	    	@loseGame = new ResultScene(0, 0, 0)
	    	@loseGame.show()
    ).start()

	onSucceededClick: ->
		@currentRemainingCats--
		if @currentRemainingCats == 0
			jsg.clearTimeout(@timeoutId)
			@isPaused = false
			@numberLostCats.numberProcessing(0)
			@wantedCat.setImage('')
			@winningRibbon.visible = true
			# window.sounds.endGame.play()
			@playEndingRibbonAnimation(@winningRibbon, 1)
		else if @currentRemainingCats > 0
			@numberLostCats.numberProcessing(@currentRemainingCats)

			@currentWantedCatIndex++
			if @currentWantedCatIndex < @numbersOfCat
				@wantedCat.setImage("maigodanya/images/wanted/wanted0#{@arrayAllCats[@currentWantedCatIndex]}.png")
			else
				@wantedCat.setImage('')

			if ((@numbersOfCat - @currentWantedCatIndex) - 1) == 4
				@bufferCat5.setImage('')
				@bufferCat4.setImage("maigodanya/images/cats/next_cat0#{@arrayAllCats[@currentWantedCatIndex + 4]}.png")
				@bufferCat3.setImage("maigodanya/images/cats/next_cat0#{@arrayAllCats[@currentWantedCatIndex + 3]}.png")
				@bufferCat2.setImage("maigodanya/images/cats/next_cat0#{@arrayAllCats[@currentWantedCatIndex + 2]}.png")
				@bufferCat1.setImage("maigodanya/images/cats/next_cat0#{@arrayAllCats[@currentWantedCatIndex + 1]}.png")
			else if ((@numbersOfCat - @currentWantedCatIndex) - 1) == 3
				@bufferCat5.setImage('')
				@bufferCat4.setImage('')
				@bufferCat3.setImage("maigodanya/images/cats/next_cat0#{@arrayAllCats[@currentWantedCatIndex + 3]}.png")
				@bufferCat2.setImage("maigodanya/images/cats/next_cat0#{@arrayAllCats[@currentWantedCatIndex + 2]}.png")
				@bufferCat1.setImage("maigodanya/images/cats/next_cat0#{@arrayAllCats[@currentWantedCatIndex + 1]}.png")
			else if ((@numbersOfCat - @currentWantedCatIndex) - 1) == 2
				@bufferCat5.setImage('')
				@bufferCat4.setImage('')
				@bufferCat3.setImage('')
				@bufferCat2.setImage("maigodanya/images/cats/next_cat0#{@arrayAllCats[@currentWantedCatIndex + 2]}.png")
				@bufferCat1.setImage("maigodanya/images/cats/next_cat0#{@arrayAllCats[@currentWantedCatIndex + 1]}.png")
			else if ((@numbersOfCat - @currentWantedCatIndex) - 1) == 1
				@bufferCat5.setImage('')
				@bufferCat4.setImage('')
				@bufferCat3.setImage('')
				@bufferCat2.setImage('')
				@bufferCat1.setImage("maigodanya/images/cats/next_cat0#{@arrayAllCats[@currentWantedCatIndex + 1]}.png")
			else if ((@numbersOfCat - @currentWantedCatIndex) - 1) == 0
				@bufferCat5.setImage('')
				@bufferCat4.setImage('')
				@bufferCat3.setImage('')
				@bufferCat2.setImage('')
				@bufferCat1.setImage('')
			else
				@bufferCat5.setImage("maigodanya/images/cats/next_cat0#{@arrayAllCats[@currentWantedCatIndex + 5]}.png")
				@bufferCat4.setImage("maigodanya/images/cats/next_cat0#{@arrayAllCats[@currentWantedCatIndex + 4]}.png")
				@bufferCat3.setImage("maigodanya/images/cats/next_cat0#{@arrayAllCats[@currentWantedCatIndex + 3]}.png")
				@bufferCat2.setImage("maigodanya/images/cats/next_cat0#{@arrayAllCats[@currentWantedCatIndex + 2]}.png")
				@bufferCat1.setImage("maigodanya/images/cats/next_cat0#{@arrayAllCats[@currentWantedCatIndex + 1]}.png")

	onFailedClick: =>
		@failedImage.visible = true
		jsg.setTimeout(@failedImageViewTiming, 500)

	failedImageViewTiming: =>
		@failedImage.visible = false

	show: ->
		# init time values for timing countdown
		@isSceneActive = false
		@tempStopTiming = 3
		@secs = 20 - 1
		@tempSecs = @secs
		@miliSecs = 90
		@tempMiliSecs = @miliSecs

		@readyRibbon.visible = true
		@readyRibbon.x = @scene.width * 1.5
		@readyRibbon.y = @scene.height / 2

		@goRibbon.x = @scene.width / 2
		@goRibbon.y = 0 - @goRibbon.height

		@gameOverRibbon.x = @scene.width * 1.5
		@gameOverRibbon.y = @scene.height * 0.9

		@winningRibbon.visible = false
		@winningRibbon.x = @scene.width * 1.5
		@winningRibbon.y = @scene.height * 0.9

		@brownCatNormalSprite.x = 0 - @brownCatNormalSprite.width
		@brownCatNormalSprite.y = @scene.height * 2 / 3
		@blackCatNormalSprite.x = @scene.width + @blackCatNormalSprite.width
		@blackCatNormalSprite.y = @scene.height * 2 / 3
		@whiteCatNormalSprite.x = 0 - @whiteCatNormalSprite.width
		@whiteCatNormalSprite.y = @scene.height * 0.87
		@grayCatNormalSprite.x = @scene.width + @grayCatNormalSprite.width
		@grayCatNormalSprite.y = @scene.height * 0.87

		@secondsPosition1.setImage('')
		@secondsPosition2.setImage('')
		@miliSecondsPosition1.setImage('')
		@miliSecondsPosition2.setImage('')

		@numberOneKey.setVisible(0)
		@numberTwoKey.setVisible(0)
		@numberThreeKey.setVisible(0)
		@numberFourKey.setVisible(0)
		@numberFiveKey.setVisible(0)
		@numberSixKey.setVisible(0)
		@numberSevenKey.setVisible(0)
		@numberEightKey.setVisible(0)

		# common variables
		@numbersOfCat = 30
		@currentRemainingCats = @numbersOfCat

		# init the array of lost cats (random initializing)
		@arrayAllCats = for i in [1..@numbersOfCat]
			Math.floor(Math.random() * 4) + 1
		@currentWantedCatIndex = 0
		@wantedCat.setImage("maigodanya/images/wanted/wanted0#{@arrayAllCats[@currentWantedCatIndex]}.png")
		@bufferCat5.setImage("maigodanya/images/cats/next_cat0#{@arrayAllCats[5]}.png")
		@bufferCat4.setImage("maigodanya/images/cats/next_cat0#{@arrayAllCats[4]}.png")
		@bufferCat3.setImage("maigodanya/images/cats/next_cat0#{@arrayAllCats[3]}.png")
		@bufferCat2.setImage("maigodanya/images/cats/next_cat0#{@arrayAllCats[2]}.png")
		@bufferCat1.setImage("maigodanya/images/cats/next_cat0#{@arrayAllCats[1]}.png")

		@numberLostCats.numberProcessing(@currentRemainingCats)
		@failedImage.visible = false

		@scene.show()
		@playReadyRibbonAnimation()
		
		# processing
		@brownId = jsg.setInterval(@playBrownCatAnimation, 100)
		#@timeId = jsg.setInterval(@playMainAnimations, 100)

		# UI
		@colon.visible = false
		@failedImage.visible = false
		@pauseBgSprite.visible = false
		@continueButton.visible = false
		@backToTopButton.visible = false
		@restartGameButton.visible = false
		@gameOverSprite.visible = false
		@pauseButton.visible = false

		#@numberFiveKey.visible = false

		# window.sounds.startGame.play()
		# window.sounds.gamePlay.playLoop()

	hide: ->
		@scene.hide()
		# window.sounds.gamePlay.pause()
		@goRibbon.visible = false
		@gameOverRibbon.visible = false
		jsg.clearTimeout(@brownId)
		# jsg.clearTimeout(@timeId)

	onBrownCatButton: =>
		if @failedImage.visible then return
		if @arrayAllCats[@currentWantedCatIndex] == PlayGameScene.BROWN_CAT
			# window.sounds.brownCat.play()
			@onSucceededClick()
		else
			# window.sounds.wrongChoice.play()
			@onFailedClick()

	onBlackCatButton: =>
		if @failedImage.visible then return
		if @arrayAllCats[@currentWantedCatIndex] == PlayGameScene.BLACK_CAT
			# window.sounds.blackCat.play()
			@onSucceededClick()
		else
			# window.sounds.wrongChoice.play()
			@onFailedClick()

	onWhiteCatButton: =>
		if @failedImage.visible then return
		if @arrayAllCats[@currentWantedCatIndex] == PlayGameScene.WHITE_CAT
			# window.sounds.whiteCat.play()
			@onSucceededClick()
		else
			# window.sounds.wrongChoice.play()
			@onFailedClick()

	onGrayCatButton: =>
		if @failedImage.visible then return
		if @arrayAllCats[@currentWantedCatIndex] == PlayGameScene.GRAY_CAT
			# window.sounds.grayCat.play()
			@onSucceededClick()
		else
			# window.sounds.wrongChoice.play()
			@onFailedClick()

	onPauseButton: =>
		@isPaused = true
		#@pauseTimeCountdown()
		jsg.clearTimeout(@timeoutId)
		@pauseBgSprite.visible = true
		#@pauseBgTimeoutID = jsg.setInterval(@playPauseAnimation, 140)
		@continueButton.visible = true
		@backToTopButton.visible = true
		@restartGameButton.visible = true

		@numberOneKey.setVisible(0)
		@numberTwoKey.setVisible(0)
		@numberThreeKey.setVisible(0)
		@numberFourKey.setVisible(0)
		@numberFiveKey.setVisible(0)
		@numberSixKey.setVisible(1)
		@numberSevenKey.setVisible(1)
		@numberEightKey.setVisible(1)

	onContinueButton: =>
		@isPaused = false
		@pauseBgSprite.visible = false
		@continueButton.visible = false
		@backToTopButton.visible = false
		@restartGameButton.visible = false
		@timeoutId = jsg.setInterval(@timeCountdown, 100)

		@numberOneKey.setVisible(1)
		@numberTwoKey.setVisible(1)
		@numberThreeKey.setVisible(1)
		@numberFourKey.setVisible(1)
		@numberFiveKey.setVisible(1)
		@numberSixKey.setVisible(0)
		@numberSevenKey.setVisible(0)
		@numberEightKey.setVisible(0)

	onBackTopButton: =>
		@hide()
		window.location = 'index.html'
		#@isPaused = false
		#topScene = new TopScene
		#topScene.show()

	onRestartButton: =>
		#window.location = 'index.html'
		@isPaused = false
		jsg.clearTimeout(@timeoutId)
		jsg.clearTimeout(@brownId)
		newPlayGameScene = window.playGameScene
		newPlayGameScene.show()

	playBrownCatAnimation: =>
		@brownCatNormalSprite.setImage(@brownImgs[@brownCatIndex])
		@blackCatNormalSprite.setImage(@blackImgs[@blackCatIndex])
		@whiteCatNormalSprite.setImage(@whiteImgs[@whiteCatIndex])
		@grayCatNormalSprite.setImage(@grayImgs[@grayCatIndex])

		@brownCatIndex++
		@blackCatIndex++
		@whiteCatIndex++
		@grayCatIndex++

		@brownCatIndex = 0 if @brownCatIndex >= 4
		@blackCatIndex = 0 if @blackCatIndex >= 5
		@whiteCatIndex = 0 if @whiteCatIndex >= 3
		@grayCatIndex = 0 if @grayCatIndex >= 5

	PlayGameScene.NUMBERS_BACKGROUND_IMAGES = 3
	PlayGameScene.NUMBERS_NEXT_RIBBON_IMAGES = 3
	PlayGameScene.NUMBER_PAUSE_BACKGROUND_IMAGES = 3
	PlayGameScene.BROWN_CAT = 1
	PlayGameScene.BLACK_CAT = 2
	PlayGameScene.WHITE_CAT = 3
	PlayGameScene.GRAY_CAT = 4