extends Camera2D


onready var player = get_tree().get_nodes_in_group("player")[0]
# Para que la camara siga al player solo en el eje horizontal
func _process(_delta):
	global_position.x = player.global_position.x
