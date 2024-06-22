extends Node2D
@export var enemyscene : PackedScene
var maxenemies = 30
# Called when the node enters the scene tree for the first time.
func _ready():
	$EnemyTimer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Player/Camera2D/CanvasLayer/Label.text = str(Engine.get_frames_per_second(), "  ", $Player/ShootTimer.time_left)
	if $Player.using_keyboard:
		$Player/Camera2D/CanvasLayer/Label2.text = "\n\n\nthe keyboard is ON.\npress 'O' to turn it off."
	if not $Player.using_keyboard:
		$Player/Camera2D/CanvasLayer/Label2.text = "\n\n\nthe keyboard is OFF"
	if Input.is_action_just_pressed("fullscreen"):
		if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	if Input.is_action_just_pressed("reset"):
		Globalpos.enemy_count = 0
		get_tree().reload_current_scene()


func _on_enemy_timer_timeout():
	if Globalpos.enemy_count < maxenemies:
		var e = enemyscene.instantiate()
		var enemy_spawn_location = $EnemyPath/EnemeySpawnLoc
		enemy_spawn_location.progress_ratio = randf()
	
	#var direction = mob_spawn_location.rotation + PI / 2
	
		e.position = enemy_spawn_location.position
	
	#direction += randf_range(-PI / 4, PI / 4)
	#mob.rotation = direction
	
	#var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	#mob.linear_velocity = velocity.rotated(direction)
	
		add_child(e)
