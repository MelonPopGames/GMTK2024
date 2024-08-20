extends Sprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if gameManager.completedLevels[0] == true:
		texture = load("res://assets/sprites/nuke_button_2.png")
