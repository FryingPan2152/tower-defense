extends Node3D

@onready var animation:=$AnimationPlayer


func _ready() -> void:
	animation.play("test_animation_1")
