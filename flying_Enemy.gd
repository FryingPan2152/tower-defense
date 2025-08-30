class_name FlyingEnemy
extends CharacterBody3D
@onready var nav:=$NavigationAgent3D
@export var destination:Destination

var health: = 100
var base_damage:= 5.0
var MAXHEALTH := 100
var died = false

func _process(delta: float) -> void:
	if health <= 0.0 && died == false: 
		died = true
		Globals.player_money += 1.0
		queue_free()
	#light.light_energy = (health/MAXHEALTH)*16

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
