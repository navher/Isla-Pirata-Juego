extends Control

func _ready():
	$Sound/Music.play()
	
func _on_Volver_pressed():
	# Cuando el boton de volver sea presionado volvemos al menu principal
	get_tree().change_scene("res://Scenes/Menu.tscn")


func _on_Volver_mouse_entered():
	#Cuando estamos encima del boton de Volver
	$Sound/Hover.play()
