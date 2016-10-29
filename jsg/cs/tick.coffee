jsg.tick = (listener) ->
  @tickListeners = [] if !@tickListeners?
  @tickListeners.push(listener)

jsg.untick = (listener) ->
  return if !@tickListeners?
  idx = @tickListeners.indexOf(listener)
  @tickListeners.splice(idx, 1) if idx != -1

jsg.fireTick = ->
  t = Date.now()

  @lastTickTimestamp ?= t
  dt = t - @lastTickTimestamp
  @lastTickTimestamp = t

  if @tickListeners?
    for listener in @tickListeners
      # Check in case @tickListeners is changed by untick while we are looping
      listener(dt, t) if listener?

  dt

#-------------------------------------------------------------------------------

class TickBasedTimeout
  constructor: (@fun, @after) ->
    @acc = 0

    # true:  this instance is used for setTimeout
    # false: this instance is used for setInterval
    @isSetTimeout = true

  onTick: (dt, t) =>
    @acc += dt
    if @acc > @after
      @fun()
      if @isSetTimeout
        jsg.untick(@onTick)
      else
        @acc = @acc % @after

  setTimeout: ->
    jsg.tick(@onTick)

  clearTimeout: ->
    jsg.untick(@onTick)

  setInterval: ->
    @isSetTimeout = false
    jsg.tick(@onTick)

  clearInterval: ->
    jsg.untick(@onTick)

# Returns a TickBasedTimeout
jsg.setTimeout = (fun, after) ->
  id = new TickBasedTimeout(fun, after)
  id.setTimeout()
  id

# id is a TickBasedTimeout
jsg.clearTimeout = (id) ->
  id.clearTimeout()

# Returns a TickBasedTimeout
jsg.setInterval = (fun, after) ->
  id = new TickBasedTimeout(fun, after)
  id.setInterval()
  id

# id is a TickBasedTimeout
jsg.clearInterval = (id) ->
  id.clearTimeout()
