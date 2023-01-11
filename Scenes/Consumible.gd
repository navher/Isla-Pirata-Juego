extends Node2D

onready var myTimer = get_node("Timer")
onready var collision = get_node("Area2D/CollisionShape2D")
onready var colisionada = false  # Para controlar que la colision se ejecute una vez

func _on_Area2D_body_entered(body):
	if body.is_in_group("player") and colisionada == false:
		# Creamos un timer para controlar el efecto de sonido y la recogida del consumible
		myTimer.set_wait_time(1)
		colisionada = true
		myTimer.start()
		
		$Sound/Consumible.play()
		
		# Desabilitamos la colision y Ocultamos el consumible hasta que acabe el timer
		collision.disabled = true
		$AnimatedSprite.hide()
		
		# Sumamos el consumible  al contador
		get_parent().consumibles += 1

func _on_Timer_timeout():
	# Cuando el timer finalize se destruye el consumible
	queue_free()
