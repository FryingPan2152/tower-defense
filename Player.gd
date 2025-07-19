extends Camera3D

var mouseposition
@onready var raycast:=$RayCast3D
var tower_selected = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Input.is_action_just_pressed("tower1"):
		tower_selected=1
	if Input.is_action_just_pressed("tower2"):
		tower_selected=2
	
	
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
		mouseposition = event.position
