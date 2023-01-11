extends CanvasLayer

onready var progress_bar = $ControlPanel/TextureProgress

func _ready():
	progress_bar.value = 100 # Al iniciar la barra de salud sera de 100
	# Controlamos la salud
	# Evento que escuchamos cuando recibe daño el player
	get_parent().connect("update_healthbar", self, "update_health")

func update_health(player_health):
	progress_bar.value = player_health # La barra vale igual que la salud del player
	# Cuando el player tenga la barra de vida vacia mostrarmos la escena Game Over
	if player_health <= 30:
		get_tree().change_scene("res://Scenes/GameOverScreen.tscn")
