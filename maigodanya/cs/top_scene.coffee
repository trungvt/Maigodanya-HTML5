class TopScene
  constructor: ->
    # init a new Scene to obtain all components
    @scene = new Scene

    # create an array of bg images
    #@bgImgs = for i in [1..TopScene.NUM_BACKGROUNDS]
    #  jsg.loadImage("maigodanya/images/top/backtopImg0#{i}.png")

    # init and assign all bg images into a sprite for displaying
    #@bgSprite = new Sprite(@bgImgs[0].width, @bgImgs[0].height)
    @bgSprite = new ImageView('maigodanya/images/top/backtopImg01.png')
    @bgSprite.prescale()
    @scene.center(@bgSprite)
    @scene.add(@bgSprite)

    @isPlaySound = true

    # @titleImgs = for i in [1..TopScene.NUM_TITLES]
    #   jsg.loadImage("maigodanya/images/title/title0#{i}.png")

    @titleImgs = for i in [1..TopScene.NUM_TITLES]
      "maigodanya/images/title/title0#{i}.png"

    # @titleSprite = new Sprite(@titleImgs[0].width, @titleImgs[0].height)
    @titleSprite = new ImageView(@titleImgs[0])
    @titleSprite.prescaleByX()
    @scene.topCenter(@titleSprite)
    @titleSprite.y = @scene.height * 0.2
    @scene.add(@titleSprite)

    @nextBgIndex    = 0
    @nextTitleIndex = 0

    # Game Start button
    @gameStartButton = new StartGameButton(@gotoPlayScene)
    @gameStartButton.width = @gameStartButton.width * 1.2
    @gameStartButton.height = @gameStartButton.height * 1.2
    @gameStartButton.prescaleByX()
    @scene.center(@gameStartButton)
    @gameStartButton.y = @scene.height * 0.7
    # @gameStartButton.offsetX = 0.5
    # @gameStartButton.offsetY = 0.5
    @scene.add(@gameStartButton)

    # How To Play button
    @howToPlayButton = new ImageButton(
      'maigodanya/images/buttons/howtoBtn.png',
      'maigodanya/images/buttons/howtoBtn.png',
      @gotoHowToPlay
    )

    @howToPlayButton.width = @howToPlayButton.width * 1.2
    @howToPlayButton.height = @howToPlayButton.height * 1.2
    @scene.center(@howToPlayButton)
    @howToPlayButton.x = @scene.width * 0.8
    @howToPlayButton.y = @scene.height * 0.4
    # @howToPlayButton.offsetX = 0.5
    # @howToPlayButton.offsetY = 0.5
    @scene.add(@howToPlayButton)

    # Keyboard images
    @numberOneKey = new Keyboard(@scene, 1, @scene.width * 0.2, @gameStartButton.y)
    @numberTwoKey = new Keyboard(@scene, 2, @scene.width * 0.92, @howToPlayButton.y)

    # Keys
    $(window).keypress((event) =>
      if (!@scene.active)                    then return
      if (event.which == '1'.charCodeAt(0))  then @gotoPlayScene()
      if (event.which == '2'.charCodeAt(0))  then @gotoHowToPlay()
      if (event.which == '4'.charCodeAt(0) && 
          event.which == '0'.charCodeAt(1) && 
          event.which == '3'.charCodeAt(2)) then window.close()
    )

  startAnimate: =>
    window.gameSound['playgame'].play()
    #@bgSprite.updateImageFit(@bgImgs[@nextBgIndex])
    @titleSprite.setImage(@titleImgs[@nextTitleIndex])

    #@nextBgIndex++
    @nextTitleIndex++
    #@nextBgIndex    = 0 if @nextBgIndex    >= TopScene.NUM_BACKGROUNDS
    @nextTitleIndex = 0 if @nextTitleIndex >= TopScene.NUM_TITLES

  playLogoAnimationDown: =>
    new TWEEN.Tween(@titleSprite).to(
      {x: @titleSprite.x, y: @scene.height * 0.2 + 30},
      800
    ).easing(
      TWEEN.Easing.Quadratic.Out
    ).start()

    if @logoAnimationDownTimeId
        jsg.clearTimeout(@logoAnimationDownTimeId)
        @logoAnimationDownTimeId = null

  playLogoAnimationUp: =>
    new TWEEN.Tween(@titleSprite).to(
      {x: @titleSprite.x, y: @scene.height * 0.2 - 20},
      800
    ).easing(
      TWEEN.Easing.Quadratic.Out
    ).start()

    if @logoAnimationUpTimeId
      jsg.clearTimeout(@logoAnimationUpTimeId)
      @logoAnimationUpTimeId = null

  show: ->
    @scene.show()
    @timerId = jsg.setInterval(@startAnimate, 140)

    # play the animation of logo 1 times
    @logoAnimationDownTimeId = jsg.setInterval(@playLogoAnimationDown, 1000)
    @logoAnimationUpTimeId = jsg.setInterval(@playLogoAnimationUp, 0)

    # window.sounds.mainTheme.playLoop()

    #componentAnimation = new ResultComponents(@scene, 1, 1, 0, 0)
    #componentAnimation.showHighScore()
    
  hide: ->
    @scene.hide()
    jsg.clearTimeout(@timerId)

  gotoPlayScene: =>
    @hide()
    # window.sounds.mainTheme.pause()
    gameScene = window.playGameScene
    gameScene.show()

  gotoHowToPlay: =>
    @hide()
    s = new HowToPlayScene
    s.show()

TopScene.NUM_BACKGROUNDS = 6
TopScene.NUM_TITLES      = 3