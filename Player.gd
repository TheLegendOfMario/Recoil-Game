extends CharacterBody2D

var can_shoot = true
const SPEED = 300.0
var recoil = 20000.0
const JUMP_VELOCITY = -400.0
@export var Bullet : PackedScene
var rotatsped = 0.1
var using_keyboard
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
func _ready():
	Globalpos.global_hub_pos = global_position
	pass

func _physics_process(delta):
	
	if can_shoot == false:
		pass
	if not using_keyboard:
		look_at(get_global_mouse_position())
	# Add the gravity.
	#if not is_on_floor():
	velocity.y += gravity/2 * delta
	if Input.is_action_pressed("left"):
		rotation -= rotatsped
		using_keyboard = true
	if Input.is_action_pressed("right"):
		rotation += rotatsped
		using_keyboard = true
	if Input.is_action_just_pressed("shoot") and can_shoot:
		
		velocity -= transform.x * recoil * delta
		shoot()
		
		
	if Input.is_action_just_pressed("keyboard_off"):
		using_keyboard = false
		
	
	
	move_and_slide()
func shoot():
	var b = Bullet.instantiate()
	owner.add_child(b)
	b.transform = $Cannon/FireFrom.global_transform
	$ShootTimer.start()
	can_shoot = false
	


func _on_shoot_timer_timeout():
	can_shoot = true
