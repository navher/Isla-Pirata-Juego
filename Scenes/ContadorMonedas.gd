extends CanvasLayer


func _process(delta):
	# Vamos mostrando la cantidad de monedas recogidas
	$Label.text = str(get_parent().coins)

