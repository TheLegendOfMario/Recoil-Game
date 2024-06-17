extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Player/Camera2D/CanvasLayer/Label.text = str(Engine.get_frames_per_second(), "  ", $Player/ShootTimer.time_left)
	if $Player.using_keyboard:
		$Player/Camera2D/CanvasLayer/Label2.text = "\n\n\nthe keyboard is ON.\npress 'P' to turn it off."
	if not $Player.using_keyboard:
		$Player/Camera2D/CanvasLayer/Label2.text = "\n\n\nthe keyboard is OFF"
	if Input.is_action_just_pressed("fullscreen"):
		if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
