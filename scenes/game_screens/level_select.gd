extends Control
class_name LevelSelect

@onready var levels: LevelIcon = $LevelIcon

# Called when the node enters the scene tree for the first time.
func _ready():
	$PlayerIcon.global_position = levels.global_position

func _input(event):
	if event.is_action_pressed("ui_left") and levels.next_level_left:
			levels = levels.next_level_left
			$PlayerIcon.global_position = levels.global_position
	if event.is_action_pressed("ui_right") and levels.next_level_right:
			levels = levels.next_level_right
			$PlayerIcon.global_position = levels.global_position
	if event.is_action_pressed("ui_up") and levels.next_level_up:
			levels = levels.next_level_up
			$PlayerIcon.global_position = levels.global_position
	if event.is_action_pressed("ui_down") and levels.next_level_down:
			levels = levels.next_level_down
			$PlayerIcon.global_position = levels.global_position
	if event.is_action_pressed("ui_accept"):
		if levels.next_scene_path:
			get_tree().change_scene_to_file(levels.next_scene_path)
