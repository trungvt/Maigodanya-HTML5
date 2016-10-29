class JSG
  createCanvasAndContext: (width, height) ->
    #if @logCanvasMemory
      #d               = Math.round(width * height * 4)
      #@canvasUsedMem ?= 0
      #@canvasUsedMem += d
      #console.log("Memory used by canvases: #{d}/#{@canvasUsedMem}")
    jsgCreateCanvasAndContext(width, height)

  #-----------------------------------------------------------------------------

  # Set to false to hide FPS status
  fps: true

  #logImageMemory: true

  #logCanvasMemory: true

  loadJSON: jsgLoadJSON

  # arg: jsOrCoffeeScriptFileName
  load: jsgLoad

  ready: (listener) ->
    @readyListeners ?= []
    @readyListeners.push(listener)

  # The web implementation needs a canvas to draw the splash screen before
  # calling fireReady.
  createCanvasAndContextForJSG: (width, height) ->
    [@canvas, @context] = @createCanvasAndContext(width, height) unless @canvas?

  # Acts like the constructor
  fireReady: (width, height) ->
    @createCanvasAndContextForJSG(width, height)
    if @readyListeners?
      for listener in @readyListeners
        listener(width, height)
    null

  drawLabel: jsgDrawLabel

  #-----------------------------------------------------------------------------

  drawFPS: (dt) ->
    console.log(dt)
    fps = Math.ceil(1000 / dt)
    ctx = @context
    ctx.fillStyle   = '#0000ff'
    ctx.strokeStyle = '#ffffff'
    ctx.font        = 'bold 40px Impact'
    ctx.fillText("#{fps} FPS", 10, 50)

  onFrame: (touchActions, touchXs, touchYs) ->
    @touch.onFrame(touchActions, touchXs, touchYs)
    dt = @fireTick()  # See tick.coffee
    @drawFPS(dt) if @fps

  #-----------------------------------------------------------------------------

  # Plugins will be attached here
  plugin: {}

  prefs:
    getString: jsgPrefsGetString
    setString: jsgPrefsSetString
    getInt:    jsgPrefsGetInt
    setInt:    jsgPrefsSetInt

  locale: jsgLocale

  alert: jsgAlert

  confirm: jsgConfirm

  # args: canvas, title, description
  saveCanvasToSystemGallery: jsgSaveCanvasToSystemGallery

  saveSpriteToSystemGallery: (sprite, title, description) ->
    jsgSaveCanvasToSystemGallery(sprite.canvas, sprite.width, sprite.height)

  #-----------------------------------------------------------------------------

  pause: (listener) ->
    @pauseListeners ?= []
    @pauseListeners.push(listener)

  firePause: ->
    @paused = true
    return if !@pauseListeners?
    for listener in @pauseListeners
      listener()
    null

  resume: (listener) ->
    @resumeListeners ?= []
    @resumeListeners.push(listener)

  fireResume: ->
    @paused = false
    return if !@resumeListeners?
    for listener in @resumeListeners
      listener()
    null

  # Can be passed as callback to jsg.pause
  pauseAllSound: =>
    #@android.callJava('js.g.MediaPlayer', 'pauseAll', '')

  #-----------------------------------------------------------------------------

  # args: fontFamily, src
  fontFace: jsgFontFace

  # Private method, used by fillTextWrap
  splitSegments: (paragraph) ->
    SEGMENT_SEPARATOR = [' ']

    ret = []
    sofar = ''

    for c in paragraph
      if c.charCodeAt(0) > 255  # CJK - no spaces between characters
        if sofar.length > 0
          ret.push(sofar)
          sofar = ''
        ret.push(c)
      else
        if c in SEGMENT_SEPARATOR
          if sofar.length > 0
            ret.push(sofar)
            sofar = ''
          ret.push(c)
        else
          sofar += c

    ret.push(sofar) if sofar.length > 0
    ret

  # http://www.c-sharpcorner.com/UploadFile/72d20e/canvas-text-wrapping-using-html-5/
  # Supports CJK (Chinese, Japanese, Korean - no spaces between characters) and \n
  fillTextWrap: (context, text, x, y, maxWidth, lineHeight) ->
    paragraphs = text.split('\n')
    for paragraph in paragraphs
      segments = @splitSegments(paragraph)
      line = ''

      for segment in segments
        testLine  = line + segment
        # NetFront 4.2 does not have measureText
        #metrics   = context.measureText(testLine)
        metrics = {width: 10}  # FIXME
        testWidth = metrics.width
        if testWidth > maxWidth
          context.fillText(line, x, y)
          y += lineHeight
          line = segment
        else
          line = testLine

      context.fillText(line, x, y)
      y += lineHeight
    null

#-------------------------------------------------------------------------------

jsg = new JSG

# Global variables should be attached to "window" object
#window = window || {}
