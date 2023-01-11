extends Control

func _ready():
	# Reproducimos la música del juego
	$Sound/Music.play()
	
func _on_Jugar_pressed():
	# Cuando el boton de JUGAR sea presionado entramos en la escena principal
	get_tree().change_scene("res://Scenes/levelPrincipal.tscn")

func _on_Salir_pressed():
	# Cuando el boton de SALIR sea presionado salimos del juego
	get_tree().quit()

func _on_Creditos_pressed():
	# Cuando el boton de CRÉDITOS sea presionado vemos la información
	get_tree().change_scene("res://Scenes/Creditos.tscn")

func _on_Jugar_mouse_entered():
	# Cuando estamos encima del boton de jugar
	$Sound/Hover.play()
	
func _on_Salir_mouse_entered():
	#Cuando estamos encima del boton de Salir
	$Sound/Hover.play()


func _on_Creditos_mouse_entered():
	#Cuando estamos encima del boton de Créditos
	$Sound/Hover.play()
