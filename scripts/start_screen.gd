extends Node2D

func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/game_screens/level_select.tscn")

func _on_button_2_pressed():
	get_tree().quit()


func _on_ready() -> void:
	MusicPlayer.play_title_music()
