extends Area2D


func _on_CaidaVacio_body_entered(body):
	# Cuando el personaje colisione con la caida al vacio mostramos escena de game over
	if body.name == "player":
		get_tree().change_scene("res://Scenes/GameOverScreen.tscn")
