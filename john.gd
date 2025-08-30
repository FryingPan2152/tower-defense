extends Tower

@onready var area: = $Area3D
@onready var shootTimer:=$ShootTimer

func _process(delta: float) -> void:
	super(delta)
	for body in area.get_overlapping_bodies():
		if body is Enemy and shootTimer.is_stopped():
			#body.health -= 200*delta 
			var proj = preload("res://projectile.tscn").instantiate()
			var dir = (body.global_position - global_position).normalized()
			proj.velocity = dir * 40
			proj.global_position = global_position
			get_parent().add_child(proj)
			shootTimer.start()
		if body is FlyingEnemy and shootTimer.is_stopped():
			#body.health -= 200*delta 
			var proj = preload("res://projectile.tscn").instantiate()
			var dir = (body.global_position - global_position).normalized()
			proj.velocity = dir * 40
			proj.global_position = global_position
			get_parent().add_child(proj)
			shootTimer.start()
