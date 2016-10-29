class HowToPlayScene
	constructor: ->
		@scene = new Scene

		# create an array of bg images
		# @bgImages = for i in [1..HowToPlayScene.NUMBERS_BACKGROUND_IMAGES]
		# 	jsg.loadImage("maigodanya/images/tutorial/howtobgImg0#{i}.png")

		# @bgSprite = new Sprite(@bgImages[0].width, @bgImages[0].height)
		@bgSprite = new ImageView('maigodanya/images/tutorial/howtobgImg01.png')
		@bgSprite.prescale()
		@scene.center(@bgSprite)
		@scene.add(@bgSprite)

		@bgImageIndex = 0

		# Back to Top button
		@topButton = new ImageButton(
			'maigodanya/images/buttons/backtopImg.png',
			'maigodanya/images/buttons/backtopImg.png',
			@backTopScene
		)
		@topButton.offSetX = 0.5
		@topButton.offSetY = 0.5
		@topButton.x = @scene.width * 0.05
		@topButton.y = @scene.height * 0.8
		@scene.add(@topButton)

		# Try Games button
		@tryGameButton = new ImageButton(
			'maigodanya/images/buttons/trygameimg.png',
			'maigodanya/images/buttons/trygameimg.png',
			@tryGame
		)
		@tryGameButton.offSetX = 0.5
		@tryGameButton.offSetY = 0.5
		@tryGameButton.x = @scene.width * 0.4
		@tryGameButton.y = @scene.height * 0.8
		@scene.add(@tryGameButton)

		# Key Pressed
		$(window).keypress((event) =>
			if (!@scene.active)										then return
			if (event.which == '1'.charCodeAt(0))	then @backTopScene()
			if (event.which == '2'.charCodeAt(0)) then @tryGame()
		)

		# Keyboard images
		@numberOneKey = new Keyboard(@scene, 1, @scene.width * 0.08, @topButton.y)
		@numberTwoKey = new Keyboard(@scene, 2, @scene.width * 0.4, @tryGameButton.y)

	playAnimation: =>
		@bgSprite.updateImageFit(@bgImages[@bgImageIndex])

		@bgImageIndex++
		@bgImageIndex = 0 if @bgImageIndex >= HowToPlayScene.NUMBERS_BACKGROUND_IMAGES

	show: ->
    @scene.show()
    @timerId = jsg.setInterval(@playThemeSound, 140)
    # @timerId = jsg.setInterval(@playAnimation, 140)

	hide: ->
    @scene.hide()
    jsg.clearTimeout(@timerId)

	backTopScene: =>
		topScene = window.topScene
		topScene.show()

	tryGame: =>
		@hide()
		# window.sounds.mainTheme.pause()
		gamePlayScene = window.playGameScene
		gamePlayScene.show()

	playThemeSound: =>
		window.gameSound['playgame'].play()

	HowToPlayScene.NUMBERS_BACKGROUND_IMAGES = 3