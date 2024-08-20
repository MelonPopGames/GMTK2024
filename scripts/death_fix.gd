extends Area2D

@onready var timer: Timer = $Timer
@onready var size: Node = %Size

func _on_body_entered(body):
	if size.size >= gameManager.playerSize:
		print("aids.")
		gameManager.playerHP = 0
		#body.get_node("CollisionShape2D").queue_free()
		timer.start()
		

func _on_timer_timeout():
	get_tree().reload_current_scene()
