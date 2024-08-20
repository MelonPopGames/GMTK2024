extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	MusicPlayer.play_level_music_2()
<<<<<<< Updated upstream
	gameManager.gameStart(10)
	gameManager.currentLevel = 3
=======
	gameManager.gameStart(5)
>>>>>>> Stashed changes
