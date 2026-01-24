class_name PlayerBody
extends CharacterBody3D

var flying := true

@onready var attack_cast := $Camera3D/RayCast3D2

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("Flight"):
		flying = not flying
		print("ARg")
	
	
	if Input.is_action_just_pressed("click") and not flying:
		if attack_cast.is_colliding():
			var attacked = attack_cast.get_collider()
			print(attacked)
			attacked.queue_free()
	
	if not is_on_floor() and not flying:
		velocity.y -= 10*delta
	
	if flying:
		velocity.y = 0
	
	
	
	if Input.is_action_pressed("forward"):
		
		var forward_no_z = -basis.z
		forward_no_z.y = 0
		
		if Input.is_action_pressed("camer speed modifier"):
			position += forward_no_z * delta * 100
		else:
			position += forward_no_z * delta * 10
		
		
	if Input.is_action_pressed("backward"):
		var forward_no_z = basis.z
		forward_no_z.y = 0
		if Input.is_action_pressed("camer speed modifier"):
			position += forward_no_z * delta * 100
		else:
			position += forward_no_z * delta * 10
		
		position += forward_no_z * delta * 10
	if Input.is_action_pressed("left"):
		position += -basis.x * delta * 10
		if Input.is_action_pressed("camer speed modifier"):
			position += -basis.x * delta * 100
		else:
			position += -basis.x * delta * 10
	if Input.is_action_pressed("right"):
		position += basis.x * delta * 10
		if Input.is_action_pressed("camer speed modifier"):
			position += +basis.x * delta * 100
		else:
			position += +basis.x * delta * 10
	if Input.is_action_pressed("Up"):
		position += +basis.z * delta * 40
	if Input.is_action_pressed("Down"):
		position += -basis.z * delta * 40
	move_and_slide()
