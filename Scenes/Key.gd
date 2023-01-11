extends Node2D

onready var myTimer = get_node("Timer")
onready var collision = get_node("Area2D/CollisionShape2D")
onready var colisionada = false # Para controlar que la colision se ejecute una vez

func _on_Area2D_body_entered(body):
	# Cuando el player colisione con la llave
	if body.is_in_group("player") and colisionada == false:
		# Creamos un timer para controlar el efecto de sonido y la recogida de la llave
		myTimer.set_wait_time(1)
		colisionada = true
		myTimer.start()
		
		$Sound/Key.play()
				
		# Desabilitamos la colision y Ocultamos la llave  hasta que acabe el timer
		collision.disabled = true
		$KeyAnimation.hide()
		
		# Sumamos la llave en el principal
		get_parent().key ='1/1'
		body.setKey(true)

func _on_Timer_timeout():
	# Cuando finalize el timer se destruye la llave
	queue_free()
	
