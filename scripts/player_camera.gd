extends Camera2D

@onready var game_manager: Node = %GameManager

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	zoom = Vector2(5,5)
	set_zoom(zoom)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_released("ZoomOut"):
		zoom = game_manager.adjustZoom(3)
		set_zoom(zoom)
	elif Input.is_action_just_released("ZoomIn"):
		zoom	 = game_manager.adjustZoom(10)	
		set_zoom(zoom)
	elif Input.is_action_just_released("ZoomDefault"):
		zoom	 = game_manager.adjustZoom(5)	
		set_zoom(zoom)
