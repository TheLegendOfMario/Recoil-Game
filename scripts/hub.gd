extends RigidBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$ProgressBar.max_value = Globalpos.maxhealth
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$ProgressBar.value = Globalpos.health
	


#func _on_collision_area_entered(area):
	#if area.is_in_group("enemy"):
		#health -= 1
