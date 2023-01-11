extends Node2D

onready var myTimer = get_node("Timer")
onready var collision = get_node("Area2D/CollisionShape2D")
onready var colisionada = false # Para controlar que la colision se ejecute una vez

func _on_Area2D_body_entered(body):
	if body.is_in_group("player") and colisionada == false:
		# Creamos un timer para controlar el efecto de sonido y la recogida de la moneda
		myTimer.set_wait_time(1)
		colisionada = true
		myTimer.start()
		
		$Sound/Coin.play()
		# Desabilitamos la colision y Ocultamos la moneda hasta que acabe el timer
		collision.disabled = true 
		$AnimatedSprite.hide() 
		# Sumamos la moneda al contador
		get_parent().coins +=1

func _on_Timer_timeout():
	# Cuando el timer finalize se destrute la moneda
	queue_free()
