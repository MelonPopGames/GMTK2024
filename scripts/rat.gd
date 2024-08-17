extends Node2D

const SPEED = 60
var DIR = 1

@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_left = $RayCastLeft
@onready var animated_sprite = $AnimatedSprite2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ray_cast_right.is_colliding():
		DIR = -1
		animated_sprite.flip_h = true
	if ray_cast_left.is_colliding():
		DIR = 1
		animated_sprite.flip_h = false
	position.x += SPEED * delta * DIR


func _on_death_body_entered(body):
	gameManager.playerHP -= 1
