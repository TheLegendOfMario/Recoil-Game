extends CharacterBody2D

@export var speed = 40 

#var target = position
#@export var rray : Array = [Globalpos.global_hub_pos,Globalpos.global_play_pos]
#func _input(event):
	#if event.is_action_pressed("click"):
		#target = get_global_mouse_position()

func _physics_process(delta):
	velocity.y -= 2
	#velocity = position.direction_to(target) * speed
	# look_at(target)
	#if position.distance_to(target) > 10:
	move_and_slide()
