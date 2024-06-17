extends CharacterBody2D

@export var speed = 400

var target = position

func _input(event):
	pass
	#if event.is_action_pressed("click"):
		#target = Globalpos.global_hub_pos

func _physics_process(delta):
	target = Globalpos.global_hub_pos
	velocity = position.direction_to(target) * speed
	look_at(target)
	if position.distance_to(target) > 10:
		move_and_slide()
