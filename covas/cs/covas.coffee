jsg.ready((width, height) ->
  jsg.stage = new Stage(width, height)
  jsg.tick(jsg.stage.onTick)
)
