extends Node
@onready var area: StaticBody2D = $StaticBody2D

func _on_area_2d_body_entered(body: Node2D) -> void:
	area.set_process(false)

func _on_area_2d_body_exited(body: Node2D) -> void:
	area.set_process(true)
