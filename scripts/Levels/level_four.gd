extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	MusicPlayer.play_level_music_2()
	gameManager.gameStart(10)
	gameManager.currentLevel = 4
