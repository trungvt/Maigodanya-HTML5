class Keyboard
  constructor: (@scene, @number, @x, @y) ->
    @keyboard = new ImageView("maigodanya/images/keyboards/keyboard_#{@number}.png")
    @keyboard.prescale()
    @keyboard.width = @keyboard.width * 0.5
    @keyboard.height = @keyboard.height * 0.5
    @keyboard.offsetX = 0.5
    @keyboard.offsetY = 0.5
    @keyboard.x = @x
    @keyboard.y = @y
    @scene.add(@keyboard)

  setVisible: (@status) ->
    if @status == 1
      @keyboard.visible = true
    else
      @keyboard.visible = false

  show: ->