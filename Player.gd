extends Camera3D

var mouseposition = Vector2(0,0)
@onready var raycast:=$RayCast3D
var tower_selected = 1
@onready var inventory_control := $tower_inventory

# Called when the node enters the scene tree for the first time.
func _ready():
	inventory_control.visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Input.is_action_just_pressed("tower1"):
		tower_selected=1
	if Input.is_action_just_pressed("tower2"):
		tower_selected=2
	if Input.is_action_just_pressed("tower_inventory"):
		inventory_control.visible = !inventory_control.visible
	
	#position.x += 10
	if Input.is_action_pressed("forward"):
		
		var forward_no_z = -basis.z
		forward_no_z.y = 0
		
		if Input.is_action_pressed("camer speed modifier"):
			position += forward_no_z * delta * 40
		else:
			position += forward_no_z * delta * 10
		
		
	if Input.is_action_pressed("backward"):
		var forward_no_z = basis.z
		forward_no_z.y = 0
		if Input.is_action_pressed("camer speed modifier"):
			position += forward_no_z * delta * 40
		else:
			position += forward_no_z * delta * 10
		
		position += forward_no_z * delta * 10
	if Input.is_action_pressed("left"):
		position += -basis.x * delta * 10
		if Input.is_action_pressed("camer speed modifier"):
			position += -basis.x * delta * 40
		else:
			position += -basis.x * delta * 10
	if Input.is_action_pressed("right"):
		position += basis.x * delta * 10
		if Input.is_action_pressed("camer speed modifier"):
			position += +basis.x * delta * 40
		else:
			position += +basis.x * delta * 10
	
	
	
	#print(mouseposition)
	#var project = project_position(mouseposition,1.0)
	#var direction = (project - position).normalized()
	var direction = project_local_ray_normal(mouseposition)
	raycast.target_position=direction*50
	if raycast.is_colliding():
		if Input.is_action_just_pressed("click"):
			var tower: Tower
			if tower_selected == 1:
				tower = preload("res://Base_tower.tscn").instantiate()
			if tower_selected == 2:
				tower = preload("res://John.tscn").instantiate()
				
			tower.global_position = raycast.get_collision_point()
			var collider = raycast.get_collider()
			var parent = collider.get_parent()
			
			if parent is NavigationRegion3D:
				#parent.bake_navigation_mesh(false)
				collider.get_parent().add_child(tower)
				
	#var dropPlane = Plane(Vector3(0,1,0))
	
	
	pass

func _input(event):
	if event is InputEventMouseMotion:
		
		if Input.is_action_pressed("Camera grab"):
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
			var delta = event.relative
			rotation.y -= delta.x * 0.001
			rotation.x -= delta.y * 0.001
		else:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
			mouseposition = event.position


func _on_tower_1_button_pressed() -> void:
	tower_selected=1


func _on_tower_2_button_pressed() -> void:
	tower_selected=2
