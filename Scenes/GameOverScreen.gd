extends CanvasLayer

func _ready():
	# Reproducimos el sonido de GAME OVER
	$Sound/Gameover.play()
	
# Cuando presionan el boton de VOLVER A JUGAR --> volver a iniciar el juego
func _on_VolverJugar_pressed():
	get_tree().change_scene("res://Scenes/levelPrincipal.tscn")

# Cuando presionan el boton de SALIR --> redirigir a la escena del menu prncipal
func _on_Salir_pressed():
	get_tree().change_scene("res://Scenes/Menu.tscn")


func _on_VolverJugar_mouse_entered():
	# Cuando estamos encima del boton de Volver a jugar
	$Sound/Hover.play()


func _on_Salir_mouse_entered():
	#Cuando estamos encima del boton de Slair
	$Sound/Hover.play()
