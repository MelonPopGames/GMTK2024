extends Sprite2D

func _process(delta: float) -> void:
	if gameManager.completedLevels[1] == true:
		texture = load("res://assets/sprites/nuke_button_2.png")
