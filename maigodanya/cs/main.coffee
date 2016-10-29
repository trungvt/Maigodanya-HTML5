jsg.fps             = false
jsg.logImageMemory  = false
jsg.logCanvasMemory = false

jsg.ready((width, height) ->
	# global scene init
	window.topScene = new TopScene
	window.playGameScene = new PlayGameScene

	# window.sounds = new Sound
	# jsg.pause(jsg.pauseAllSound)

	window.gameSound = {}

	window.gameSound['playgame'] = document.getElementById('playgame')
	window.gameSound['playgame'].loop = true
	window.gameSound['playgame'].autoplay = true

	s = window.topScene
	s.show()
)
