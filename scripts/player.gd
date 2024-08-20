extends CharacterBody2D


var SPEED = 150.0
var JUMP_VELOCITY = -300.0
var defaultScale = 1

var pushForce = 0.0

#var hp = 1;


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var game_manager: Node = %GameManager

func _physics_process(delta):
	# Add the gravity.
	if gameManager.playerHP != 0:
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
		if gameManager.playerHP != 0:
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

		

		move_and_slide()
		
		for i in get_slide_collision_count():
			var c = get_slide_collision(i)
			if c.get_collider() is RigidBody2D:
				c.get_collider().apply_central_impulse(-c.get_normal() * pushForce)
	else:
		animated_sprite_2d.play("death")

func _process(delta: float) -> void:
	if gameManager.canChangeSize and gameManager.timeCanChange != 0:
		if Input.is_action_just_released("ZoomOut"):
			scale = game_manager.adjustZoom(defaultScale, 2)
			gameManager.playerSize = 3
			gameManager.timeCanChange -= 1
			gameManager.changeCameraSize = true
		elif Input.is_action_just_released("ZoomIn"):
			scale = game_manager.adjustZoom(defaultScale, 0.5)
			gameManager.playerSize = 1
			gameManager.timeCanChange -= 1
			gameManager.changeCameraSize = true
		elif Input.is_action_just_released("ZoomDefault"):
			scale = game_manager.adjustZoom(defaultScale, 1)
			gameManager.playerSize = 2
			gameManager.timeCanChange -= 1
			gameManager.changeCameraSize = true
	
	if gameManager.playerSize == 2:
		SPEED = 150.0
		JUMP_VELOCITY = -300.0
		pushForce = 0.0
	elif gameManager.playerSize == 1:
		SPEED = 200.0
		JUMP_VELOCITY = -400.0
		pushForce = 0.0
	else:
		SPEED = 100.0
		JUMP_VELOCITY = -125.0
		pushForce = 50.0
