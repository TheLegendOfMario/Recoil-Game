extends CharacterBody2D
var hurt = 0
@export var speed = 40 

#var target = position
#@export var rray : Array = [Globalpos.global_hub_pos,Globalpos.global_play_pos]
#func _input(event):
	#if event.is_action_pressed("click"):
		#target = get_global_mouse_position()
func _ready():
	Globalpos.enemy_count += 1
func _physics_process(delta):
	velocity.y -= 2
	#velocity = position.direction_to(target) * speed
	# look_at(target)
	#if position.distance_to(target) > 10:
	move_and_slide()


func _on_area_2d_area_entered(area):
	if area.is_in_group("bullet") or area.is_in_group("laser"):
		Globalpos.enemy_count -= 1
		Globalpos.score += 1
		queue_free()
	if area.is_in_group("hub"):
		hurt = 1
		if hurt == 1:
			Globalpos.health -= 100


func _on_area_2d_area_exited(area):
	if area.is_in_group("hub"):
		hurt = 0
