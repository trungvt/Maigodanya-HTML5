class StartGameButton extends ImageButton
	constructor: (tapListener) ->
		super(
			'maigodanya/images/buttons/gamestartBtn.png',
        	'maigodanya/images/buttons/gamestartBtn.png',
        	=> tapListener()
		)