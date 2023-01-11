extends CanvasLayer

func _process(delta):
	# Mostrando  que hemos cogido la llave
	$Label.text = str(get_parent().key)

