extends Control

@onready var label:= $Label

func _process(delta: float) -> void:
	label.text = str(Globals.player_money)
	pass
