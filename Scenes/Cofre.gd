extends Node2D

onready var myTimer = get_node("Timer")

func _ready():
	$CofreAnimation.play("Idle")

func _on_Area2D_body_entered(body):
	# Cuando el player colisione con el cofre
	if body.is_in_group("player"):
		if body.isKey():
			myTimer.set_wait_time(2.3)
			myTimer.start()
			$Sound/Win.play()
			$CofreAnimation.play("Unlocked")



func _on_Timer_timeout():
	get_tree().change_scene("res://Scenes/WinMenu.tscn")
