extends KinematicBody2D

signal update_healthbar

onready var hitbox = $Hitbox
onready var sprite = $AnimatedSprite

const GRAVITY : int = 25
const UP = Vector2(0, -1)
const JUMP : int = -400
var vel : int = 100
var velRapida : int = 180

var motion := Vector2()
var health : int = 100 # Salud de nuestro personaje
var inmune = false # Para darle inmunidad al player cuando agachamos

var haveKey = false; # Para controlar si tengo la llave

func setKey(key):
	# Modificamos el valor de la variable de control
	haveKey = key

func isKey():
	# Para saber el valor que tenemos en la varibale de control
	# Devolvemos el valor de la variable
	return haveKey

func _physics_process(delta):
	# Para que la gravedad afecte al personaje
	motion.y += GRAVITY
	# Nos hace falta para que el personaje no ande infinitamente
	var friction = false 
	
	if Input.is_action_pressed("Derecha"):
		motion.x = vel
		sprite.play("Run")
		inmune = false
		sprite.flip_h = false # Porque esta mirando a la derecha
	elif Input.is_action_pressed("Izquierda"):
		motion.x = -vel
		sprite.play("Run")
		inmune = false
		sprite.flip_h = true
	elif Input.is_action_pressed("Abajo"):
		inmune = true
		motion.x = 0
		sprite.play("Down")
	else:
		motion.x = 0
		sprite.play("Idle")	
		friction = true
		inmune = false
	
	# Para poder ir a mayor velocidad
	if Input.is_action_pressed("Rapido"):
		vel = velRapida
	else:
		vel = 100      
		
	if is_on_floor():
		if Input.is_action_just_pressed("ui_accept"):
			$Sound/Jump.play()
			motion.y = JUMP
	
		if friction == true:
			motion.x = lerp(motion.x,0,0.05)
	else:
		if friction == true:
			sprite.play("Jump")
			motion.x = lerp(motion.x,0,0.01)
			
	motion = move_and_slide(motion, UP) # Para poder verlo
	
# Controlar la salud de nuestro personaje
func damage_player(damage):
	# Reproducimos el sonido de DAÑO
	if inmune == false:
		$Sound/Hit.play()
		health -= damage # Parámetro para definir la cantidad de vida que se le elimina
		emit_signal("update_healthbar", health) # Evento que lanzamos cuando recibe daño el player
	
	
	
