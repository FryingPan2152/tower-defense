class_name Tower
extends Node3D

@onready var timer: = $Timer


# Called when the node enters the scene tree for the first time.
func _ready():
	
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass


func _on_timer_timeout():
	if get_parent() is NavigationRegion3D:
		print("baking")
		get_parent().bake_navigation_mesh(true)
		pass
