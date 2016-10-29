class ResultComponents
	constructor: (@scene, @typeOfScene, @status, @secs, @miliSecs) ->

		# @typeOfScene == 1: TopScene, == 2: Result Scene

		@r1 = new ImageView('maigodanya/images/result/resultMaterial/r1.png')
		@r1.prescale()
		@r1.x = 0
		@r1.y = 0
		@scene.add(@r1) if @typeOfScene == 2

		@r2 = new ImageView('maigodanya/images/result/resultMaterial/r2.png')
		@r2.prescale()
		@r2.x = 0
		@r2.y = 0
		@scene.add(@r2) if @typeOfScene == 2

		@r3 = new ImageView('maigodanya/images/result/resultMaterial/r3.png')
		@r3.prescale()
		@r3.x = @scene.width
		@r3.y = 0
		@scene.add(@r3) if @typeOfScene == 2

		@r4 = new ImageView('maigodanya/images/result/resultMaterial/r4.png')
		@r4.prescale()
		@r4.x = @scene.width
		@r4.y = 0
		@scene.add(@r4) if @typeOfScene == 2

		@p1 = new ImageView('maigodanya/images/result/resultMaterial/p1.png')
		@p1.prescale()
		@p1.x = 0
		@p1.y = 0
		@scene.add(@p1) if @typeOfScene == 2

		@p2 = new ImageView('maigodanya/images/result/resultMaterial/p2.png')
		@p2.prescale()
		@p2.x = 0
		@p2.y = 0
		@scene.add(@p2) if @typeOfScene == 2

		@p3 = new ImageView('maigodanya/images/result/resultMaterial/p3.png')
		@p3.prescale()
		@p3.x = 0
		@p3.y = 0
		@scene.add(@p3) if @typeOfScene == 2

		@p4 = new ImageView('maigodanya/images/result/resultMaterial/p4.png')
		@p4.prescale()
		@p4.x = 0
		@p4.y = 0
		@scene.add(@p4) if @typeOfScene == 2

		@p5 = new ImageView('maigodanya/images/result/resultMaterial/p5.png')
		@p5.prescale()
		@p5.x = 0
		@p5.y = 0
		@scene.add(@p5) if @typeOfScene == 2

		@p6 = new ImageView('maigodanya/images/result/resultMaterial/p6.png')
		@p6.prescale()
		@p6.x = 0
		@p6.y = 0
		@scene.add(@p6) if @typeOfScene == 2

		@p7 = new ImageView('maigodanya/images/result/resultMaterial/p7.png')
		@p7.prescale()
		@p7.x = 0
		@p7.y = 0
		@scene.add(@p7) if @typeOfScene == 2

		@p8 = new ImageView('maigodanya/images/result/resultMaterial/p8.png')
		@p8.prescale()
		@p8.x = 0
		@p8.y = 0
		@scene.add(@p8) if @typeOfScene == 2

		@p9 = new ImageView('maigodanya/images/result/resultMaterial/p9.png')
		@p9.prescale()
		@p9.x = 0
		@p9.y = 0
		@scene.add(@p9) if @typeOfScene == 2

		@p10 = new ImageView('maigodanya/images/result/resultMaterial/p10.png')
		@p10.prescale()
		@p10.x = 0
		@p10.y = 0
		@scene.add(@p10) if @typeOfScene == 2

		@timeOver = new ImageView('maigodanya/images/result/resultMaterial/timeout.png')
		@timeOver.prescale()
		#@timeOver.width = @timeOver.width * 0.8
		#@timeOver.height = @timeOver.height * 0.8
		@timeOver.offsetX = 0.5
		@timeOver.offsetY = 0.5
		@timeOver.x = 0
		@timeOver.y = 0
		@scene.add(@timeOver) if @typeOfScene == 2

		@speedText = new ImageView('maigodanya/images/result/resultMaterial/speedText.png')
		@speedText.prescale()
		#@speedText.width = @speedText.width * 0.8
		#@speedText.height = @speedText.height * 0.8
		@speedText.offsetX = 0.5
		@speedText.offsetY = 0.5
		@speedText.x = 0
		@speedText.y = 0
		@scene.add(@speedText) if @typeOfScene == 2

		@maigoText = new ImageView('maigodanya/images/result/resultMaterial/maigoText.png')
		@maigoText.prescale()
		#@maigoText.width = @maigoText.width * 0.8
		#@maigoText.height = @maigoText.height * 0.8
		@maigoText.offsetX = 0.5
		@maigoText.offsetY = 0.5
		@maigoText.x = 0
		@maigoText.y = 0
		@scene.add(@maigoText) if @typeOfScene == 2

		# init the time counting
		@secondsPosition1 = new ImageView
		@secondsPosition1.prescale()
		@secondsPosition1.offsetX = 0.5
		@secondsPosition1.offsetY = 0.5
		@secondsPosition1.x = @scene.width * 0.3
		@secondsPosition1.y = @scene.height * 0.32
		@scene.add(@secondsPosition1) if @typeOfScene == 2

		@secondsPosition2 = new ImageView
		@secondsPosition2.prescale()
		@secondsPosition2.offsetX = 0.5
		@secondsPosition2.offsetY = 0.5
		@secondsPosition2.x = @scene.width * 0.36
		@secondsPosition2.y = @scene.height * 0.32
		@scene.add(@secondsPosition2) if @typeOfScene == 2

		@colon = new ImageView('maigodanya/images/numbers/num_mm.png')
		@colon.prescale()
		@colon.offsetX = 0.5
		@colon.offsetY = 0.5
		@colon.x = @scene.width * 0.42
		@colon.y = @scene.height * 0.32
		@scene.add(@colon) if @typeOfScene == 2

		@miliSecondsPosition1 = new ImageView
		@miliSecondsPosition1.prescale()
		@miliSecondsPosition1.offsetX = 0.5
		@miliSecondsPosition1.offsetY = 0.5
		@miliSecondsPosition1.x = @scene.width * 0.48
		@miliSecondsPosition1.y = @scene.height * 0.32
		@scene.add(@miliSecondsPosition1) if @typeOfScene == 2

		@miliSecondsPosition2 = new ImageView
		@miliSecondsPosition2.prescale()
		@miliSecondsPosition2.offsetX = 0.5
		@miliSecondsPosition2.offsetY = 0.5
		@miliSecondsPosition2.x = @scene.width * 0.54
		@miliSecondsPosition2.y = @scene.height * 0.32
		@scene.add(@miliSecondsPosition2) if @typeOfScene == 2

		@secondsText = new ImageView('maigodanya/images/result/resultMaterial/secondText.png')
		@secondsText.prescale()
		@secondsText.width = @secondsText.width * 0.6
		@secondsText.height = @secondsText.height * 0.6
		@secondsText.offsetX = 0.5
		@secondsText.offsetY = 0.5
		@secondsText.x = @scene.width * 0.65
		@secondsText.y = @scene.height * 0.32
		@scene.add(@secondsText) if @typeOfScene == 2

		@highscoreText = new ImageView('maigodanya/images/result/resultMaterial/hiscoreText.png')
		@highscoreText.prescale()
		#@highscoreText.width = @highscoreText.width * 0.8
		#@highscoreText.height = @highscoreText.height * 0.8
		@highscoreText.offsetX = 0.5
		@highscoreText.offsetY = 0.5
		@highscoreText.x = 0
		@highscoreText.y = @scene.height / 2
		@scene.add(@highscoreText) if @typeOfScene == 2

		# High Score label
		@hsSecondsPosition1 = new ImageView
		@hsSecondsPosition1.prescale()
		@hsSecondsPosition1.offsetX = 0.5
		@hsSecondsPosition1.offsetY = 0.5
		if @typeOfScene == 1
			@hsSecondsPosition1.x = @scene.width * 0.3
			@hsSecondsPosition1.y = @scene.height * 0.92
		else
			@hsSecondsPosition1.x = @scene.width * 0.3
			@hsSecondsPosition1.y = @scene.height * 0.46
		@scene.add(@hsSecondsPosition1)

		@hsSecondsPosition2 = new ImageView
		@hsSecondsPosition2.prescale()
		@hsSecondsPosition2.offsetX = 0.5
		@hsSecondsPosition2.offsetY = 0.5
		if @typeOfScene == 1
			@hsSecondsPosition2.x = @scene.width * 0.36
			@hsSecondsPosition2.y = @scene.height * 0.92
		else
			@hsSecondsPosition2.x = @scene.width * 0.36
			@hsSecondsPosition2.y = @scene.height * 0.46
		@scene.add(@hsSecondsPosition2)

		@hsColon = new ImageView('maigodanya/images/numbers/num_mm.png')
		@hsColon.prescale()
		@hsColon.offsetX = 0.5
		@hsColon.offsetY = 0.5
		if @typeOfScene == 1
			@hsColon.x = @scene.width * 0.42
			@hsColon.y = @scene.height * 0.92
		else
			@hsColon.x = @scene.width * 0.42
			@hsColon.y = @scene.height * 0.46
		@scene.add(@hsColon)

		@hsMiliSecondsPosition1 = new ImageView
		@hsMiliSecondsPosition1.prescale()
		@hsMiliSecondsPosition1.offsetX = 0.5
		@hsMiliSecondsPosition1.offsetY = 0.5
		if @typeOfScene == 1
			@hsMiliSecondsPosition1.x = @scene.width * 0.48
			@hsMiliSecondsPosition1.y = @scene.height * 0.92
		else
			@hsMiliSecondsPosition1.x = @scene.width * 0.48
			@hsMiliSecondsPosition1.y = @scene.height * 0.46
		@scene.add(@hsMiliSecondsPosition1)

		@hsMiliSecondsPosition2 = new ImageView
		@hsMiliSecondsPosition2.prescale()
		@hsMiliSecondsPosition2.offsetX = 0.5
		@hsMiliSecondsPosition2.offsetY = 0.5
		if @typeOfScene == 1
			@hsMiliSecondsPosition2.x = @scene.width * 0.54
			@hsMiliSecondsPosition2.y = @scene.height * 0.92
		else
			@hsMiliSecondsPosition2.x = @scene.width * 0.54
			@hsMiliSecondsPosition2.y = @scene.height * 0.46
		@scene.add(@hsMiliSecondsPosition2)

		@secondsEnglishText = new ImageView('maigodanya/images/second.png')
		@secondsEnglishText.prescale()
		#@secondsEnglishText.width = @secondsEnglishText.width * 0.8
		#@secondsEnglishText.height = @secondsEnglishText.height * 0.8
		@secondsEnglishText.offsetX = 0.5
		@secondsEnglishText.offsetY = 0.5
		if @typeOfScene == 1
			@secondsEnglishText.x = @scene.width * 0.7
			@secondsEnglishText.y = @scene.height * 0.92
		else
			@secondsEnglishText.x = @scene.width * 0.7
			@secondsEnglishText.y = @scene.height * 0.46
		@scene.add(@secondsEnglishText)

	playRibbonAnimation: =>
		new TWEEN.Tween(@r1).to(
			{x: @scene.width * 0.15, y: @scene.height * 0.3},
			800
		).easing(
			TWEEN.Easing.Quadratic.Out
		).start()
		new TWEEN.Tween(@r2).to(
			{x: @scene.width * 0.15, y: @scene.height * 0.5},
			800
		).easing(
			TWEEN.Easing.Quadratic.Out
		).start()
		new TWEEN.Tween(@r3).to(
			{x: @scene.width * 0.8, y: @scene.height * 0.25},
			800
		).easing(
			TWEEN.Easing.Quadratic.Out
		).start()
		new TWEEN.Tween(@r4).to(
			{x: @scene.width * 0.8, y: @scene.height * 0.5},
			800
		).easing(
			TWEEN.Easing.Quadratic.Out
		).start()
		new TWEEN.Tween(@p1).to(
			{x: @scene.width * 0.25, y: @scene.height * 0.3},
			800
		).easing(
			TWEEN.Easing.Quadratic.Out
		).start()
		new TWEEN.Tween(@p2).to(
			{x: @scene.width * 0.1, y: @scene.height * 0.4},
			800
		).easing(
			TWEEN.Easing.Quadratic.Out
		).start()
		new TWEEN.Tween(@p3).to(
			{x: @scene.width * 0.4, y: @scene.height * 0.4},
			800
		).easing(
			TWEEN.Easing.Quadratic.Out
		).start()
		new TWEEN.Tween(@p4).to(
			{x: @scene.width * 0.7, y: @scene.height * 0.45},
			800
		).easing(
			TWEEN.Easing.Quadratic.Out
		).start()
		new TWEEN.Tween(@p5).to(
			{x: @scene.width * 0.65, y: @scene.height * 0.35},
			800
		).easing(
			TWEEN.Easing.Quadratic.Out
		).start()
		new TWEEN.Tween(@p6).to(
			{x: @scene.width * 0.55, y: @scene.height * 0.4},
			800
		).easing(
			TWEEN.Easing.Quadratic.Out
		).start()
		new TWEEN.Tween(@p7).to(
			{x: @scene.width * 0.2, y: @scene.height * 0.45},
			800
		).easing(
			TWEEN.Easing.Quadratic.Out
		).start()
		new TWEEN.Tween(@p8).to(
			{x: @scene.width * 0.5, y: @scene.height * 0.2},
			800
		).easing(
			TWEEN.Easing.Quadratic.Out
		).start()
		new TWEEN.Tween(@p9).to(
			{x: @scene.width * 0.5, y: @scene.height * 0.5},
			800
		).easing(
			TWEEN.Easing.Quadratic.Out
		).start()
		new TWEEN.Tween(@p10).to(
			{x: @scene.width * 0.4, y: @scene.height * 0.7},
			800
		).easing(
			TWEEN.Easing.Quadratic.Out
		).start()

		if @status == 0
			@timeOver.visible = true
			@speedText.visible = true
			new TWEEN.Tween(@timeOver).to(
				{x: @scene.width * 0.5, y: @scene.height * 0.3},
				800
			).easing(
				TWEEN.Easing.Quadratic.Out
			).start()

			new TWEEN.Tween(@speedText).to(
				{x: @scene.width * 0.5, y: @scene.height * 0.4},
				800
			).easing(
				TWEEN.Easing.Quadratic.Out
			).start()
		else
			@colon.visible = true
			@hsColon.visible = true
			@secondsText.visible = true
			@secondsPosition1.visible = true
			@secondsPosition2.visible = true
			@miliSecondsPosition1.visible = true
			@miliSecondsPosition2.visible = true
			@maigoText.visible = true
			@highscoreText.visible = true
			@hsSecondsPosition1.visible = true
			@hsSecondsPosition2.visible = true
			@hsMiliSecondsPosition1.visible = true
			@hsMiliSecondsPosition2.visible = true
			@secondsEnglishText.visible = true

			new TWEEN.Tween(@maigoText).to(
				{x: @scene.width * 0.45, y: @scene.height * 0.25},
				800
			).easing(
				TWEEN.Easing.Quadratic.Out
			).start()

			new TWEEN.Tween(@highscoreText).to(
				{x: @scene.width * 0.4, y: @scene.height * 0.4},
				800
			).easing(
				TWEEN.Easing.Quadratic.Out
			).start()

	showHighScore: ->
		@highscoreValue = config.getHighScore()
		@highscoreValueArray = "#{@highscoreValue}".split ":"

		@hsSecondsArray = ["", ""]
		@hsSecondsArray = "#{@highscoreValueArray[0]}".split ""
		if @highscoreValueArray[0] < 10
			@hsSecondsPosition1.setImage("maigodanya/images/numbers/num_s-0.png")
			@hsSecondsPosition2.setImage("maigodanya/images/numbers/num_s-#{@hsSecondsArray[0]}.png")
		else
			@hsSecondsPosition1.setImage("maigodanya/images/numbers/num_s-#{@hsSecondsArray[0]}.png")
			@hsSecondsPosition2.setImage("maigodanya/images/numbers/num_s-#{@hsSecondsArray[1]}.png")

		@hsMiliSecondsArray = ["", ""]
		@hsMiliSecondsArray = "#{@highscoreValueArray[1]}".split ""
		if @highscoreValueArray[1] < 10
			@hsMiliSecondsPosition1.setImage("maigodanya/images/numbers/num_s-0.png")
			@hsMiliSecondsPosition2.setImage("maigodanya/images/numbers/num_s-#{@hsMiliSecondsArray[0]}.png")
		else
			@hsMiliSecondsPosition1.setImage("maigodanya/images/numbers/num_s-#{@hsMiliSecondsArray[0]}.png")
			@hsMiliSecondsPosition2.setImage("maigodanya/images/numbers/num_s-#{@hsMiliSecondsArray[1]}.png")

	show: ->
		@colon.visible = false
		@secondsText.visible = false
		@secondsPosition1.visible = false
		@secondsPosition2.visible = false
		@miliSecondsPosition1.visible = false
		@miliSecondsPosition2.visible = false
		@speedText.visible = false
		@maigoText.visible = false
		@timeOver.visible = false
		@highscoreText.visible = false
		@hsSecondsPosition1.visible = false
		@hsSecondsPosition2.visible = false
		@hsMiliSecondsPosition1.visible = false
		@hsMiliSecondsPosition2.visible = false
		@hsColon.visible = false
		@secondsEnglishText.visible = false

		@secondsArray = ["", ""]
		@secondsArray = "#{@secs}".split ""
		if @secs < 10
			@secondsPosition1.setImage("maigodanya/images/numbers/num_m-0.png")
			@secondsPosition2.setImage("maigodanya/images/numbers/num_m-#{@secondsArray[0]}.png")
		else
			@secondsPosition1.setImage("maigodanya/images/numbers/num_m-#{@secondsArray[0]}.png")
			@secondsPosition2.setImage("maigodanya/images/numbers/num_m-#{@secondsArray[1]}.png")
		
		@miliSecondsArray = ["", ""]
		@miliSecondsArray = "#{@miliSecs}".split ""
		if @miliSecs < 10
			@miliSecondsPosition1.setImage("maigodanya/images/numbers/num_m-0.png")
			@miliSecondsPosition2.setImage("maigodanya/images/numbers/num_m-#{@miliSecondsArray[0]}.png")
		else 
			@miliSecondsPosition1.setImage("maigodanya/images/numbers/num_m-#{@miliSecondsArray[0]}.png")
			@miliSecondsPosition2.setImage("maigodanya/images/numbers/num_m-#{@miliSecondsArray[1]}.png")

		@showHighScore()

		jsg.setTimeout(@playRibbonAnimation, 1200)

	ResultComponents.NUMBER_RIBBON_IMAGES = 4
      