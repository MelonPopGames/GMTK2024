extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	MusicPlayer.play_level_music_1()
	gameManager.gameStart(12)
	gameManager.currentLevel = 1
