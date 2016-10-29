class NumberCatsComponent
	constructor: (@scene) ->
		# init 3 image view to obtain seperate number
		# @number1 = new ImageView
		# @number1.prescale()
		# @scene.add(@number1)

		@number2 = new ImageView
		@number2.prescale()
		@scene.add(@number2)

		@number3 = new ImageView
		@number3.prescale()
		@scene.add(@number3)

		# init array of 3 seperate number

	numberProcessing: (@numberCats) ->
		@numberArray = ["", ""]
		@numberArray = "#{@numberCats}".split ""
		# if @numberCats >= 100
		#	 @number1.setImage("maigodanya/images/numbers/num_m-#{@numberArray[0]}.png")
		#	 @number2.setImage("maigodanya/images/numbers/num_m-#{@numberArray[1]}.png")
		#	 @number3.setImage("maigodanya/images/numbers/num_m-#{@numberArray[2]}.png")
		if @numberCats >= 10
			# @number1.setImage('')
			@number2.setImage("maigodanya/images/numbers/num_m-#{@numberArray[0]}.png")
			@number3.setImage("maigodanya/images/numbers/num_m-#{@numberArray[1]}.png")
		if @numberCats < 10
			# @number1.setImage('')
			@number2.setImage("maigodanya/images/numbers/num_m-0.png")
			@number3.setImage("maigodanya/images/numbers/num_m-#{@numberArray[0]}.png")

		# @number1.offsetX = 0.5
		# @number1.offsetY = 0.5
		# @number1.x = @scene.width * 0.05
		# @number1.y = @scene.height * 0.46

		@number2.offsetX = 0.5
		@number2.offsetY = 0.5
		@number2.x = @scene.width * 0.1
		@number2.y = @scene.height * 0.46

		@number3.offsetX = 0.5
		@number3.offsetY = 0.5
		@number3.x = @scene.width * 0.15
		@number3.y = @scene.height * 0.46

	show: ->

