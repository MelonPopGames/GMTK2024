extends Node2D

func _on_ready() -> void:
	MusicPlayer.play_title_music()

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene_to_file("res://scenes/game_screens/level_select.tscn")
	elif Input.is_action_just_pressed("LeaveLevel"):
		get_tree().quit()
