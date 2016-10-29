class HintScene
	constructor: ->
		@scene = new Scene
		@mainSound = Sound.gamePlay
		@mainSound.loop = true
		@mainSound.play()

		@bgSprite = new Sprite(jsg.stage.width, jsg.stage.height)
		@bgImage = jsg.loadImage("maigodanya/images/tutorial/howtopgame.png")
		@bgSprite.updateImageFit(@bgImage)
		@scene.add(@bgSprite)

	show: ->
    	@scene.show()
    	@timerId = jsg.setInterval(@goToNextScene, 2000)

    goToNextScene: =>
    	@hide()
    	@mainSound.pause()
    	jsg.clearTimeout(@timerId)
    	playGameScene = new PlayGameScene
    	playGameScene.show()

    hide: ->
	    @scene.hide()
	    jsg.clearTimeout(@timerId)