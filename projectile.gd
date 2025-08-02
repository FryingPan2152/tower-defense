extends Node3D

var velocity: Vector3
@onready var area:=$Area3D
var hit = false

func _physics_process(delta: float) -> void:
	for body in area.get_overlapping_bodies():
		if hit == false:
			if body is Enemy:
				body.health -= 100
				hit = true
				queue_free()
	
	
	global_position += velocity * delta
