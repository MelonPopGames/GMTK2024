extends Node
@onready var area: StaticBody2D = $StaticBody2D

var check1 = false
var check2 = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	check1 = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	check1 = false

func _on_area_2d_2_body_entered(body: Node2D) -> void:
	check2 = true

func _process(delta):
	if check1 and check2:
		area.set_process(false)
	else:
		area.set_process(true)
