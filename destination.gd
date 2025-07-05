class_name Destination
extends Node3D

@onready var area:= $Area3D

func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	
	
	for body in area.get_overlapping_bodies():
		if body is Enemy:
			body.queue_free()
	pass
	
