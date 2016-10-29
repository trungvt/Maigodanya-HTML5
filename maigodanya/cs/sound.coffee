class MediaPlayerWithConfig
  constructor: (base) ->
    return if isNetFront
    src = @mp3OrOgg(base)
    @mediaPlayer = new Audio(src)

  play: ->
    return if isNetFront
    @mediaPlayer.play() if !jsg.paused

  # Can be passed as callback to jsg.resume
  playLoop: =>
    return if isNetFront
    return if jsg.paused
    if false #@mediaPlayer.playLoop?
      @mediaPlayer.playLoop()
    else
      @mediaPlayer.loop = true
      @mediaPlayer.play()

  stop: ->
    return if isNetFront
    #if @mediaPlayer.stop? then @mediaPlayer.stop() else @mediaPlayer.pause()
    @mediaPlayer.pause()

  pause: ->
    return if isNetFront
    @mediaPlayer.pause()

  mp3OrOgg: (base) ->
    return '' if isNetFront
    if !@canPlayOgg?
      audio = new Audio('')
      @canPlayOgg = ('' != audio.canPlayType('audio/ogg'))
    ext = if @canPlayOgg then 'ogg' else 'mp3'
    ext = 'ogg'
    base + '.' + ext

class Sound
  constructor: ->
    @mainTheme   = new MediaPlayerWithConfig('maigodanya/sound/hajimetenootsukai')
    @gamePlay    = new MediaPlayerWithConfig('maigodanya/sound/kibou')
    @startGame   = new MediaPlayerWithConfig('maigodanya/sound/start_game')
    @wrongChoice = new MediaPlayerWithConfig('maigodanya/sound/wrong')
    @resultScene = new MediaPlayerWithConfig('maigodanya/sound/result_scene')
    @endGame     = new MediaPlayerWithConfig('maigodanya/sound/fan')

    # Brown Cat sound
    @brownCat      = new MediaPlayerWithConfig('maigodanya/sound/catvoice1')
    @brownCatTweet = new MediaPlayerWithConfig('maigodanya/sound/griss_up1')

    # Black Cat sound
    @blackCat      = new MediaPlayerWithConfig('maigodanya/sound/catvoice2')
    @blackCatTweet = new MediaPlayerWithConfig('maigodanya/sound/griss_up2')

    # White Cat sound
    @whiteCat      = new MediaPlayerWithConfig('maigodanya/sound/catvoice3')
    @whiteCatTweet = new MediaPlayerWithConfig('maigodanya/sound/griss_up3')

    # Gray Cat sound
    @grayCat      = new MediaPlayerWithConfig('maigodanya/sound/catvoice4')
    @grayCatTweet = new MediaPlayerWithConfig('maigodanya/sound/griss_up4')
