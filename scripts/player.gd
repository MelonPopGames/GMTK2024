extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = -300.0
var defaultScale = 1
var hp = 1;


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var game_manager: Node = %GameManager

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	#get input dir
	var direction = Input.get_axis("MoveLeft", "MoveRight")
	
	#flips the sprite
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true
	
	#play animations
	if is_on_floor():
		if direction == 0:
			animated_sprite_2d.play("idle")
		else:
			animated_sprite_2d.play("run")
	else:
		animated_sprite_2d.play("jump")
	
	#apply movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if gameManager.playerHP <= 0:
		queue_free()

	move_and_slide()


func _process(delta: float) -> void:
	if Input.is_action_just_released("ZoomOut"):
		scale = game_manager.adjustZoom(defaultScale, 2)
	elif Input.is_action_just_released("ZoomIn"):
		scale = game_manager.adjustZoom(defaultScale, 0.5)
	elif Input.is_action_just_released("ZoomDefault"):
		scale = game_manager.adjustZoom(defaultScale, 1)
