extends ParallaxBackground

# Para realizar el parallax del background del menu principal
var dir = Vector2(-1,0)
var speed = 100

func _process(delta):
	scroll_base_offset += dir * speed * delta
