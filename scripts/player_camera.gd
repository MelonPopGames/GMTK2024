extends Camera2D

@onready var game_manager: Node = %GameManager

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	zoom = Vector2(4,4)
	set_zoom(zoom)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_released("ZoomOut"):
		zoom = game_manager.adjustZoom(2)
		set_zoom(zoom)
	elif Input.is_action_just_released("ZoomIn"):
		zoom	 = game_manager.adjustZoom(8)	
		set_zoom(zoom)
	elif Input.is_action_just_released("ZoomDefault"):
		zoom	 = game_manager.adjustZoom(4)	
		set_zoom(zoom)
