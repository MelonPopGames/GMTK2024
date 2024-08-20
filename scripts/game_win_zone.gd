extends Area2D

@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	gameManager.gameWin = true
	gameManager.completedLevels[gameManager.currentLevel - 1] = true
	gameManager.currentLevel = 0
	timer.start()

func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/game_screens/level_select.tscn")
