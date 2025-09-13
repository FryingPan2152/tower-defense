extends Node3D
@onready var area:= $Area3D
@onready var editor_box := $CSGBox3D
@export var added_vel:= Vector3()

func _ready() -> void:
	editor_box.visible = false

func _physics_process(delta: float) -> void:
	for body in area.get_overlapping_bodies():
		if body is Enemy or body is FlyingEnemy:
			body.velocity += added_vel * delta
	
	
	
