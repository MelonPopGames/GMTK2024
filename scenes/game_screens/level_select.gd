extends Control
class_name LevelSelect

@onready var levels: LevelIcon = $LevelIcon

# Called when the node enters the scene tree for the first time.
func _ready():
	MusicPlayer.play_title_music()
	gameManager.currentLevel = 0
	$PlayerIcon.global_position = levels.global_position

func _input(event):
	var tween = get_tree().create_tween()
	if event.is_action_pressed("ui_left") and levels.next_level_left:
			levels = levels.next_level_left
			tween.tween_property($PlayerIcon, "position", levels.position, 0.1)
			await get_tree().create_timer(0.1).timeout
			$PlayerIcon.global_position = levels.global_position
	if event.is_action_pressed("ui_right") and levels.next_level_right:
			levels = levels.next_level_right
			tween.tween_property($PlayerIcon, "position", levels.position, 0.1)
			await get_tree().create_timer(0.1).timeout
			$PlayerIcon.global_position = levels.global_position
	if event.is_action_pressed("ui_up") and levels.next_level_up:
			levels = levels.next_level_up
			tween.tween_property($PlayerIcon, "position", levels.position, 0.1)
			await get_tree().create_timer(0.1).timeout
			$PlayerIcon.global_position = levels.global_position
	if event.is_action_pressed("ui_down") and levels.next_level_down:
			levels = levels.next_level_down
			tween.tween_property($PlayerIcon, "position", levels.position, 0.1)
			await get_tree().create_timer(0.1).timeout
			$PlayerIcon.global_position = levels.global_position
	if event.is_action_pressed("ui_accept"):
		if levels.next_scene_path:
			get_tree().change_scene_to_file(levels.next_scene_path)
