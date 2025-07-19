extends Node3D


# TODO: Money system by defeating enemies, tower 2 can be goblin archer, 
# make base be able to attack enemies when they get close, tower three can be summoner, tower 4 can be close range ogre
# Tower five can be warlock, 


@onready var timer:= $Timer
@onready var nav := $NavigationRegion3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	nav.bake_navigation_mesh()
	print("baked")
