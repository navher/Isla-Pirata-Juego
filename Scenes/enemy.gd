extends KinematicBody2D

export (int) var damage : int = 30 # Daño del enemigo

onready var hitbox = $Hitbox 

const MAX_SPEED : float = 100.0
const GRAVITY : float = 25.0

var motion := Vector2()

func _ready():
	$AnimatedSprite.scale.x = -1 # Para que el enemigo empieze hacia la derecha
	motion.x = MAX_SPEED
	# Cuando el player colisione con el enemigo
	hitbox.connect("body_entered", self, "_on_damage_player") 

# Comprobamos los raycast
func _next_to_left_wall() -> bool:
	return $RayCastLeft.is_colliding()

func _next_to_right_wall() -> bool:
	return $RayCastRight.is_colliding()
	
func _floor_detection() -> bool:
	return $AnimatedSprite/FloorDetection.is_colliding()

func _flip():
	# 3 situaciones que queremos que gire el enemigo
	if _next_to_right_wall() or _next_to_left_wall() or !_floor_detection():
		motion.x *= -1
		$AnimatedSprite.scale.x *= -1
		
func _process(delta):
	motion.y += GRAVITY
	_flip()
	
	motion = move_and_slide(motion)
	
# Daño al player
func _on_damage_player(body):
	if body.is_in_group("player"):
		body.damage_player(damage)
		
