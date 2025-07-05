class_name Enemy
extends CharacterBody3D
@export var destination:Destination
@onready var nav:=$NavigationAgent3D



func _physics_process(delta: float) -> void:
	
	if destination != null && nav.target_position != destination.global_position:
		nav.target_position = destination.global_position
		
	if !is_on_floor(): 
		velocity.y += -10 * delta
	
	var np = nav.get_next_path_position()
	var direction = (np - global_position).normalized()
	velocity += direction * delta * 100.0
	velocity = velocity.limit_length(5.0)
	move_and_slide()
