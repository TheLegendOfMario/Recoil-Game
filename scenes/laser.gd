extends Area2D
var can_move = true
const SPEED = 30
# Called when the node enters the scene tree for the first time.
func _ready():
	look_at(get_global_mouse_position())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if can_move:
		position += transform.y * SPEED


func _on_body_entered(body):
	if body.is_in_group("walls") or body.is_in_group("enemy") or body.is_in_group("hub"):
		explode()

func explode():
	#scale = Vector2(6, 6)
	queue_free()
	
	#$KillTimer.start()

func _on_kill_timer_timeout():
	#queue_free()
	pass
